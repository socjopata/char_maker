# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Wizard do
  before do
    @character =  FactoryGirl.create(:character)
    @character.create_character_background
  end

  context "profession_and_origin" do

    context "get" do
      it "should return proper wizard instance object" do
        @wizard = Wizard.new(@character, "profession_and_origin")
        @wizard.character.character_background.traits.should == []

        professions = ProfessionSelector.new(@character).results
        @wizard.instance_variable_get("@professions").should == professions

        profession = professions.first
        @wizard.instance_variable_get("@profession").should == profession

        countries = Profession.find_by_name(profession.name).countries
        @wizard.instance_variable_get("@countries").should == countries

        @wizard.instance_variable_get("@deities").should == DeitySelector.new(@character, countries.first.id, profession.id).deities
      end
    end

    context "post" do
      #it "should not build statistics for character if they are present" do
      #  params = {}  #TODO
      #  stats = @character.build_statistics
      #  stats.save(:validate => false)
      #  @wizard = Wizard.new(@character, "profession_and_origin")
      #  @wizard.character.statistics.initial_dice_roll_set.should == nil
      #end
      #
      #it "should build statistics for character if they are blank" do
      #  params = {}  #TODO
      #  @wizard = Wizard.new(@character, "profession_and_origin", params)
      #  @wizard.character.statistics.initial_dice_roll_set.size.should == 6
      #end
    end

  end

end
