# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController

  before_filter :user_signed_in?

  #TODO Disclaimer: I know that things here, with all the logic in this place, suck a big time.
  #Idea: Refactor using some kind of state machine, or classes,
  #that after initialization perform various actions on Alantar models, depending on :get or :post


  def first_step
    if request.get?
      @character = current_user.characters.find(params[:char_id])
      if @character.character_background.blank?
        @character_background = @character.build_character_background
        @character_background.draw_a_trait if @character.hardcore_trait_picking
        @character_background.save
      end
      @professions = Profession.all
      @countries ||= Profession.find_by_name(@professions.first.name).countries
    elsif request.post?
      @character = current_user.characters.find(params[:char_id])
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class if @character.character_background.social_classes.blank?
      @character.character_background.fill_the_purse_with_gold unless @character.purse.present?
      redirect_to second_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def second_step
    if request.get?
      @character = current_user.characters.find(params[:char_id])
      @character.statistics.stats_modifiers.clear #flush stats modifiers from character statistics in case user gets back here from third step

      @profession_skillset = @character.statistics.push_profession_modifiers
    elsif request.post?
      @character = current_user.characters.find(params[:char_id])
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
      @character = current_user.characters.find(params[:char_id])

      #do a rollback here
      #TODO possibly redundant
      session[:skill_free_assignment_base] = nil
      session[:default_skills_ids] = nil
      session[:skills_used] = nil

      @character.skills.each { |skill| skill.substract_skill_from(@character.id) }

      roll_set = @character.statistics.initial_dice_roll_set
      @lead_parameter = roll_set[0..4].max
      @stats = roll_set.tap { |a| a.delete_at(roll_set[0..4].rindex(roll_set[0..4].max)) }

      #do a show
    elsif request.post?
      @character = current_user.characters.find(params[:char_id])
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
      @character = current_user.characters.find(params[:char_id])
      @character.make_rogue_a_finesse_fighter
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats
    elsif request.post?
      @character = current_user.characters.find(params[:char_id])
      if @character.fight_style.present? or @character.update_attribute(:fight_style_id, params[:fight_style_id])
        redirect_to fourth_step_character_wizard_path(:char_id => @character.id)
      else
        flash.alert = "Czy aby napewno zależności Siła/Zręczność a wybrany styl walki, są spełnione?"
        redirect_to pick_a_fightstyle_step_character_wizard_path(:char_id => @character.id)
      end
    end
  end

  def fourth_step
    if request.get?
      @character = current_user.characters.find(params[:char_id])
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats #TODO group in hash or array.
      @basic_skills = Skill.basic
      @caste_skills = Skill.fetch_caste_skills_for(@character)
      @profession_skills = Skill.fetch_profession_skills_for(@character)
      @cannot_select_skills = Skill.filter_nonselectable((@basic_skills + @caste_skills + @profession_skills), @character, @strength, @dexterity, @endurance, @intelligence, @faith, @polish)
      @free_skill_amount = Skill.calculate_free_skill_amount(@character, session[:skill_free_assignment_base], Statistics::BONUS_OR_PENALTY_RANGES[@intelligence].to_i, session[:skills_used].to_i)
    elsif request.post?
      @character = current_user.characters.find(params[:char_id])
      if @character.any_unfinished_matters_present?
        redirect_to optional_step_character_wizard_path(:char_id => @character)
      else
        redirect_to armament_step_character_wizard_path(:char_id => @character)
      end
    end
  end

  def optional_step
    if request.get?
      @character = current_user.characters.find(params[:char_id])
    elsif request.post?
    end
  end

   def armament_step
    if request.get?
      @character = current_user.characters.find(params[:char_id])
    elsif request.post?
    end
  end


  def update_countries_select
    character = current_user.characters.find(params[:char_id])
    profession = Profession.find(params[:id])
    countries = profession.countries
    countries = [Country.find_by_name("Złote Królestwa")] if countries.present? && profession.name=="Rycerz" && character.gender=="Kobieta" #Overwrite for the special case of a women being a knight...
    render :partial => "countries", :locals => {:countries => countries}
  end

  def toggle_skill
    character = current_user.characters.find(params[:character_id])
    params[:value]=="true" ? (next_number = session[:skills_used].to_i + 1) : (next_number = session[:skills_used].to_i - 1)
    session[:skills_used] = next_number
    @free_skill_amount = Skill.calculate_free_skill_amount(character, session[:skill_free_assignment_base], Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_int].to_i, session[:skills_used].to_i)

    if @free_skill_amount < 0
      session[:skills_used] = session[:skills_used].to_i - 1 #reverting the change
      @not_enough_free_skill_points = true
      render :layout => "colorbox"
    else
      skill = Skill.find(params[:skill_id])
      @commands, @skill_commands = Skill.change(character, skill, params[:value]=="true")
    end

    #TODO what about clever "skills" picking? Manipulating choices so you choose something to enable other skill and then uncheck the enabler...
  end

end
