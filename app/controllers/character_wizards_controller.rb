# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController

  before_filter :user_signed_in?, :get_current_character
  before_filter :prepare_statistics_hash, :only => [:armament_step, :update_weapons_select, :update_ranged_weapons_select, :update_armors_select, :update_shields_select]

  #TODO Disclaimer: I know that things here, with all the logic in this place, suck a big time.
  #Idea: Refactor using some kind of state machine, or classes,
  #that after initialization perform various actions on Alantar models, depending on :get or :post
  #also make some before_filter

  def first_step
    if request.get?
      @character.character_background.draw_a_trait if @character.hardcore_trait_picking && @character.character_background.origin.blank?
      @professions = ProfessionSelector.new(@character).results
      @countries ||= Profession.find_by_name(@professions.first.name).countries
    elsif request.post?
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class if @character.character_background.social_classes.blank?
      @character.character_background.fill_the_purse_with_gold unless @character.purse.present?
      @character.character_background.update_attribute(:deity_id, params[:deity_id])
      redirect_to second_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def second_step
    if request.get?
      @character.statistics.stats_modifiers.clear #flush stats modifiers from character statistics in case user gets back here from third step

      @profession_skillset = @character.statistics.push_profession_modifiers
    elsif request.post?
      @character.lead_parameter = params[:main_skill]
      @character.statistics.push_social_class_stats_modifiers(params[:social_stat_choices])
      @character.statistics.push_origin_stats_modifiers(params[:origin_stat_choices])
      @character.save(false)
      if @character.valid_for_step_three?
        redirect_to third_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to second_step_character_wizard_path(:char_id => @character.id), :alert => "Zdaję się, że nie dokonałeś jeszcze wszystkich wyborów wymaganych przez kreator postaci"
      end
    end
  end

  def third_step
    if request.get?
      #do a rollback here   #or in characters' new?
      session[:skill_free_assignment_base] = nil
      session[:default_skills_ids] = nil
      session[:skills_used] = nil
      session[:weapon_class_preference_left] = nil
      session[:coins_left] = nil

      @character.skills.each { |skill| skill.substract_skill_from(@character.id) }

      roll_set = @character.statistics.initial_dice_roll_set
      @lead_parameter = roll_set[0..4].max
      @stats = roll_set.tap { |a| a.delete_at(roll_set[0..4].rindex(roll_set[0..4].max)) }

      #do a show
    elsif request.post?
      if @character.statistics.update_attributes(params[:statistics]) && @character.valid_for_step_fourth? && @character.valid_stats_assignment?
        skill_free_assignment_base, default_skills_ids = @character.statistics.convert_stat_choices_to_skills
        session[:skill_free_assignment_base] = skill_free_assignment_base
        session[:default_skills_ids] = default_skills_ids
        redirect_to pick_a_fightstyle_step_character_wizard_path(:char_id => @character.id)
      else
        flash.alert = "Napewno dobrze uzupełniłeś statystyki?"
        flash.alert << " Zwróć szczególna uwagę na swój dar: \"#{@character.character_background.traits.first.try(:name)}\" i sposób w jaki musisz przyporządkować drugi najwyższy wylosowany paramter." unless  @character.valid_stats_assignment?
        redirect_to third_step_character_wizard_path(:char_id => @character.id)
      end
    end
  end

  def pick_a_fightstyle_step
    if request.get?
      @character.make_rogue_a_finesse_fighter
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats
    elsif request.post?
      if @character.fight_style.present? or @character.update_attributes(:fight_style_id => params[:fight_style_id], :wield_style_id => params[:wield_style_id] )
        redirect_to fourth_step_character_wizard_path(:char_id => @character.id)
      else
        flash.alert = "Czy aby napewno zależności Siła/Zręczność a wybrany styl walki, są spełnione?"
        redirect_to pick_a_fightstyle_step_character_wizard_path(:char_id => @character.id)
      end
    end
  end

  def fourth_step
    if request.get?
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats #TODO group in hash or array.
      @basic_skills = Skill.basic
      @caste_skills = Skill.fetch_caste_skills_for(@character)
      @profession_skills = Skill.fetch_profession_skills_for(@character)
      @cannot_select_skills = Skill.filter_nonselectable((@basic_skills + @caste_skills + @profession_skills), @character, @strength, @dexterity, @endurance, @intelligence, @faith, @polish)
      @free_skill_amount = Skill.calculate_free_skill_amount(@character, session[:skill_free_assignment_base], Statistics::BONUS_OR_PENALTY_RANGES[@intelligence].to_i, session[:skills_used].to_i)
    elsif request.post?
      session[:coins_left] = @character.purse.update_current if @character.purse.current.blank?
      session[:weapon_class_preference_left] = @character.statistics.calculate_weapon_class_proficiencies_points
      redirect_to after_skills_step_character_wizard_path(:char_id => @character)
    end
  end

  def after_skills_step
    if request.get?
      @weapon_groups = Weapon.all.map(&:group_name).uniq
    elsif request.post?
      if @character.any_unfinished_matters_present?
        flash.alert = "Musisz sprecyzować bonusy wynikające z umiejętności"
        redirect_to after_skills_step_character_wizard_path(:char_id => @character)
      else
        redirect_to armament_step_character_wizard_path(:char_id => @character)
      end
    end
  end

  def armament_step
    if request.get?
      @weapons, @weapon_groups = ArmamentMaster.new(@character, "Weapon", @statistics_hash, {:group_name => nil}).prepare_items_collection
      @armors, @armor_groups = ArmamentMaster.new(@character, "Armor", @statistics_hash, {:group_name => nil}).prepare_items_collection
      @shields, @shield_groups = ArmamentMaster.new(@character, "Shield", @statistics_hash, {:group_name => nil}).prepare_items_collection
      @ranged_weapons, @ranged_weapon_groups = ArmamentMaster.new(@character, "RangedWeapon", @statistics_hash, {:group_name => nil}).prepare_items_collection
    elsif request.post?
      if @character.has_valid_shopping_list?(session[:coins_left])
        if @character.is_of_scholar_class_type?
          redirect_to picking_spells_step_character_wizard_path(:char_id => @character)
        else
          @character.update_attribute(:finished, true)
          redirect_to characters_path
          #TODO save number of coins, free skills left...
          #make it finished and redirect to index or show
        end
      else
        redirect_to :back, :alert => @character.errors.full_messages.to_sentence(:two_words_connector => ". ")
      end
    end
  end

  def picking_spells_step
    if request.get?

    elsif request.post?

    end
  end


  def set_shield_as_main
    @character.set_shield_as_main(params[:inventory_item].to_i)
  end

  def set_armor_as_main
      @character.set_armor_as_main(params[:inventory_item].to_i)
  end


  def update_countries_select
    country_selector = CountrySelector.new(@character, params[:id])
    render :partial => "countries", :locals => {:countries => country_selector.countries}
  end

  def toggle_skill
    @commands, @skill_commands, @not_enough_free_skill_points, @free_skill_amount, session[:skills_used] = SkillToggler.new(@character, session[:skills_used], params[:skill_id], params[:value]=="true", session[:skill_free_assignment_base]).process!
    render :layout => "colorbox" if @not_enough_free_skill_points.present?
  end

  def toggle_weapon_proficiency
    session[:weapon_class_preference_left], @errors = @character.toggle_weapon_class_preference(params[:name], params[:value], session[:weapon_class_preference_left])
  end

  def set_skill_preference
    @stats_modifier = StatsModifier.find(params[:id])
    @stats_modifier.as_character_skill(@character).create_skill_bonus_preference(:choice => params[:choice])
  end

  def update_weapons_select
    weapons = ArmamentMaster.new(@character, "Weapon", @statistics_hash, {:group_name => params[:weapon_group]}).prepare_items_collection.first
    render :partial => "character_wizards/armament_stuff/weapons", :locals => {:weapons => weapons}
  end

  def update_ranged_weapons_select
    ranged_weapons = ArmamentMaster.new(@character, "RangedWeapon", @statistics_hash, {:group_name => params[:ranged_weapon_group]}).prepare_items_collection.first
    render :partial => "character_wizards/armament_stuff/ranged_weapons", :locals => {:ranged_weapons => ranged_weapons}
  end

  def update_armors_select
    armors = ArmamentMaster.new(@character, "Armor", @statistics_hash, {:group_name => params[:armor_group]}).prepare_items_collection.first
    render :partial => "character_wizards/armament_stuff/armors", :locals => {:armors => armors}
  end

  def update_shields_select
    shields = ArmamentMaster.new(@character, "Shield", @statistics_hash, {:group_name => params[:shield_group]}).prepare_items_collection.first
    render :partial => "character_wizards/armament_stuff/shields", :locals => {:shields => shields}
  end

  def add_item_to_inventory
    @shopkeeper = Shopkeeper.new(@character, params[:inventory_item], params[:item_type], "add", session[:coins_left])
    session[:coins_left] = @shopkeeper.purse
  end

  def remove_item_from_inventory
    @shopkeeper = Shopkeeper.new(@character, params[:inventory_item], params[:item_type], "remove", session[:coins_left], params[:delete_id])
    session[:coins_left] = @shopkeeper.purse
  end

  def improve_item
    @blacksmith = Blacksmith.new(@character, params[:inventory_item], params[:item_type], "improve", session[:coins_left], params[:improvement_id], params[:improvement_type])
    session[:coins_left] = @blacksmith.purse
  end

  def revert_improvement
    @blacksmith = Blacksmith.new(@character, params[:inventory_item], params[:item_type], "revert", session[:coins_left], params[:improvement_id], params[:improvement_type])
    session[:coins_left] = @blacksmith.purse
  end

  private

  def get_current_character
    @character = current_user.characters.find(params[:char_id])
  end

  def prepare_statistics_hash
    @statistics_hash = @character.calculate_stats_and_store_them_as_a_hash
  end

end


