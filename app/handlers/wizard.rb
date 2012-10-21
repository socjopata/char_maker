class Wizard

  attr_accessor :character
  attr_reader :step, :render, :redirect, :params, :errors

  def initialize(character, step, params=nil)
    @character = character
    @step = step
    @params = params

    self.send(step.to_sym)
  end

  def profession_and_origin
    if params
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.character_background.update_attribute(:deity_id, params[:deities])
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class if @character.character_background.social_classes.blank?
      @character.character_background.fill_the_purse_with_gold unless @character.purse.present?
      @redirect = character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
    else
      @character.character_background.draw_a_trait if @character.hardcore_trait_picking && @character.character_background.origin.blank?
      @professions = ProfessionSelector.new(@character).results
      @profession = @professions.first
      @countries ||= Profession.find_by_name(@profession.name).countries
      @deities ||= DeitySelector.new(@character, @countries.first.id, @profession.id).deities

      @render = "character_wizards/#{step}"
    end
  end

  def profession_and_origin_choices

  end

end