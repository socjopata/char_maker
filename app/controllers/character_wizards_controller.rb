# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController

  before_filter :user_signed_in?, :get_current_character, :disallow_editing_finished_character
  before_filter :prepare_statistics_hash, :only => [:armament_step, :update_weapons_select, :update_ranged_weapons_select, :update_armors_select, :update_shields_select]
  #TODO Disclaimer: I know that things here, with all the logic in this place, suck a big time.
  #NEW: I am refactoring this crap right now.


  def show
    @wizard = Wizard.new(@character, params[:step])
    render_or_redirect
  end

  def create
    @wizard = Wizard.new(@character, params[:step], params)
    render_or_redirect
  end

  def render_or_redirect
    if @wizard.errors
      redirect_to(@wizard.redirect, :alert => @wizard.errors)
    elsif @wizard.render
      render :template => @wizard.render
    elsif @wizard.redirect
      redirect_to @wizard.redirect
    end
  end

  #def after_skills_step
  #  if request.get?
  #    @weapon_groups = WeaponGroupProficiencySelector.new(@character).weapon_groups
  #  elsif request.post?
  #    if @character.valid_for_armament_step?
  #      redirect_to armament_step_character_wizard_path(:char_id => @character)
  #    else
  #      flash.alert = ""
  #      flash.alert << "Musisz sprecyzować bonusy wynikające z umiejętności." if @character.any_unfinished_matters_present?
  #      flash.alert << " Jako strzelec, musisz być biegły przynajmniej w jednej grupie broni dystansowej." if @character.is_a_shooter_and_didnt_picked_his_bow
  #      redirect_to after_skills_step_character_wizard_path(:char_id => @character)
  #    end
  #  end
  #end

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
          @character.finish!(session[:skill_free_assignment_base], session[:coins_left], session[:skills_used].to_i)
          redirect_to characters_path
          #make it finished and redirect to index or show
        end
      else
        redirect_to :back, :alert => @character.errors.full_messages.to_sentence(:two_words_connector => ". ")
      end
    end
  end

  def picking_spells_step
    if request.get?
      @scribe = Scribe.new(@character)
    elsif request.post?
      @character.finish!(session[:skill_free_assignment_base], session[:coins_left], session[:skills_used].to_i)
      redirect_to characters_path
    end
  end

  def toggle_spell
    @scribe = Scribe.new(@character)
    @scribe.learn_spell(params[:spell_id], params[:value])
    render :layout => "colorbox" if @scribe.not_enough_free_spell_points
  end

  def set_shield_as_main
    @character.set_shield_as_main(params[:inventory_item].to_i)
  end

  def set_armor_as_main
    @character.set_armor_as_main(params[:inventory_item].to_i)
  end

  def update_countries_select
    @profession = Profession.find(params[:id])
    country_selector = CountrySelector.new(@character, @profession)
    render :partial => "countries", :locals => {:countries => country_selector.countries, :profession => @profession}
  end

  def update_deities_select
    deity_selector = DeitySelector.new(@character, params[:id], params[:profession_id])
    render :partial => "deities", :locals => {:deities => deity_selector.deities}
  end

  def toggle_skill
    @skill_toggler = SkillToggler.new(@character, params[:skill_id], params[:value]=="true")
    render :layout => "colorbox" if @skill_toggler.not_enough_free_skill_points.present?
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

  def disallow_editing_finished_character
    redirect_to characters_path(:alert => "Nie można edytować ukończonych postaci") if @character.finished?
  end

end


