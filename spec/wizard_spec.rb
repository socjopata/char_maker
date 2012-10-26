# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Wizard do
  before do
    @character =  FactoryGirl.create(:character)
    @character.create_character_background
  end

  context "profession_and_origin" do

    context "get" do
      it 'should return valid wizard instance object' do
        @wizard = Wizard.new(@character, "profession_and_origin")
        @wizard.character.character_background.traits.should == []

        professions = ProfessionSelector.new(@character).results
        @wizard.instance_variable_get("@professions").should == professions

        profession = professions.first
        @wizard.instance_variable_get("@profession").should == profession

        countries = Profession.find_by_name(profession.name).countries
        @wizard.instance_variable_get("@countries").should == countries

        @wizard.instance_variable_get("@deities").should == DeitySelector.new(@character, countries.first.id, profession.id).deities
        @wizard.render.should == "character_wizards/profession_and_origin"
      end

      it 'should draw a trait for a sane amount of tries if user has chosen trait picking' do
        @character.update_attributes(:hardcore_trait_picking => true)
        30.times do
          @wizard = Wizard.new(@character, "profession_and_origin")
          break if @wizard.character.character_background.traits.present?
        end
        @wizard.character.character_background.traits.size.should == 1
      end
    end

    context "post" do
      it 'should not build statistics for character if they are present' do
        params = {:professions => 8, :countries => 1, :deities => 4, :step =>"profession_and_origin", :method => :post}
        stats = @character.build_statistics
        stats.save(:validate => false)
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.statistics.initial_dice_roll_set.should == nil
      end

      it 'should build statistics for character if they are blank' do
        params = {:professions => 8, :countries => 1, :deities => 4, :step =>"profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.statistics.initial_dice_roll_set.size.should == 6
      end

      it 'should return valid wizard instance object' do
        params = {:professions => 8, :countries => 1, :deities => 4, :step =>"profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.character_background.origin.should be_instance_of(Origin)
        @wizard.character.character_background.deity.should be_instance_of(Deity)
        @wizard.character.profession.should be_instance_of(Profession)
        @wizard.character.character_background.social_classes.size.should == 1
        Purse.last.character_id.should == @wizard.character.id
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
      end

      it 'should attach default social class for civilized character for hardcore_social_class_picking false' do
        #TODO
      end

      it 'should attach default social class for barbarian character for hardcore_social_class_picking false' do
        #TODO
      end


    end
  end

end
