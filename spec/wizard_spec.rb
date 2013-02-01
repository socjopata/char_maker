# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Wizard do
  before do
    @character = FactoryGirl.create(:character)
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
        params = {:professions => 8, :countries => 1, :deities => 4, :step => "profession_and_origin", :method => :post}
        stats = @character.build_statistics
        stats.save(:validate => false)
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.statistics.initial_dice_roll_set.should == nil
      end

      it 'should build statistics for character if they are blank' do
        params = {:professions => 8, :countries => 1, :deities => 4, :step => "profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.statistics.initial_dice_roll_set.size.should == 6
      end

      it 'should return valid wizard instance object' do
        params = {:professions => 8, :countries => 1, :deities => 4, :step => "profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.character_background.origin.should be_instance_of(Origin)
        @wizard.character.character_background.deity.should be_instance_of(Deity)
        @wizard.character.profession.should be_instance_of(Profession)
        @wizard.character.character_background.social_classes.size.should == 1
        Purse.last.character_id.should == @wizard.character.id
        @wizard.errors.should == nil
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
      end

      it 'should attach default social class for civilized character for hardcore_social_class_picking false' do
        profession = Profession.find_by_name("Żołnierz")
        country = Country.find_by_name("Alantar")
        params = {:professions => profession.id, :countries => country.id, :deities => country.deities.first.id, :step => "profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.character_background.social_classes.first.name.should == "Mieszczanin"
      end

      it 'should attach default social class for barbarian character for hardcore_social_class_picking false' do
        profession = Profession.find_by_name("Żołnierz")
        country = Country.find_by_name("Góry Księżycowe i Niczyje")
        params = {:professions => profession.id, :countries => country.id, :deities => country.deities.first.id, :step => "profession_and_origin", :method => :post}
        @wizard = Wizard.new(@character, "profession_and_origin", params)
        @wizard.character.character_background.social_classes.first.name.should == "Wojownik"
      end
    end
  end


  context "profession_and_origin_choices" do
    before do
      setup_profession_and_origin_choices
    end

    context "get" do
      it 'should return valid wizard instance object' do
        @wizard = Wizard.new(@character, "profession_and_origin_choices")
        @wizard.instance_variable_get("@profession_skillset").should_not == []
        @wizard.render.should == "character_wizards/profession_and_origin_choices"
      end
    end

    context "post" do
      it 'should return valid wizard instance object' do
        params = {:step => "profession_and_origin_choices", :main_skill => "S",
                  :social_stat_choices => {"63" => "domyślne", "64" => "domyślne", "65" => "domyślne", "66" => "Jedna wolna umiejętność"},
                  :origin_stat_choices => {"115" => "checked", "118" => "Sokoli wzrok", "119" => "Handel"}}
        @wizard = Wizard.new(@character, "profession_and_origin_choices", params)
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "statistics")
        @wizard.errors.should == nil
      end

      it 'should redirect back if the character is not valid, because of bad origin choices' do
        params = {:step => "profession_and_origin_choices", :main_skill => "S",
                  :social_stat_choices => {"63" => "domyślne", "64" => "domyślne", "65" => "domyślne", "66" => "Jedna wolna umiejętność"},
                  :origin_stat_choices => {"115" => "checked", "119" => "Handel"}}
        @wizard = Wizard.new(@character, "profession_and_origin_choices", params)
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
        @wizard.errors.should_not == nil
      end

      it 'should redirect back if the character is not valid, because of bad social class choices' do
        params = {:step => "profession_and_origin_choices", :main_skill => "S",
                  :social_stat_choices => {"63" => "domyślne", "64" => "domyślne", "65" => "domyślne", "66" => "Jedna wolna umiejętność"},
                  :origin_stat_choices => {"115" => "checked", "118" => "Sokoli wzrok"}}
        @wizard = Wizard.new(@character, "profession_and_origin_choices", params)
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
        @wizard.errors.should_not == nil
      end

    end

  end

  context "statistics" do
    before do
      setup_profession_and_origin_choices
    end

    context "get" do
      it 'should return valid wizard instance object' do
        @wizard = Wizard.new(@character, "statistics")
        @wizard.character.skills.should be_empty
        @wizard.instance_variable_get("@lead_parameter").should_not be_nil
        @wizard.instance_variable_get("@stats").should_not be_empty
        @wizard.render.should == "character_wizards/statistics"
        assert @wizard.instance_variable_get("@stats")[0..3].none? { |number| number > @wizard.instance_variable_get("@lead_parameter") }
      end

    end

    context "post" do
      it 'should return valid wizard instance object' do
        params = {:statistics =>
                      {"strength" => "16",
                       "dexterity" => "5",
                       "endurance" => "16",
                       "intelligence" => "17",
                       "faith" => "15",
                       "polish" => @character.statistics.initial_dice_roll_set.last},
        }

        @wizard = Wizard.new(@character, "statistics", params)
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "fightstyle")
        @wizard.errors.should == nil

        @wizard.character.skills.should_not be_empty

        skill = Skill.find_by_name("Weteran Wojenny")
        @wizard.character.skills.should include(skill)
        @wizard.character.session.should have_key(:skill_free_assignment_base)
        @wizard.character.session.should have_key(:default_skills_ids)
      end

      it 'should not allow misplacement of polish dice roll' do
        params = {:statistics =>
                      {"strength" => "16",
                       "dexterity" => "5",
                       "endurance" => "16",
                       "intelligence" => "17",
                       "faith" => "15",
                       "polish" => "0"},
        }
        @wizard = Wizard.new(@character, "statistics", params)
        @wizard.errors.should_not be_empty
      end

      it 'should enforce proper assignment for choice breaker traits' do
        #TODO difficult one
      end
    end
  end


  context "fightstyle" do
    before do
      setup_profession_and_origin_choices
      setup_statistics
    end


    context "get" do
      it 'should return valid wizard instance object' do
        @wizard = Wizard.new(@character, "fightstyle")
        @wizard.render.should == "character_wizards/fightstyle"
      end

      it 'should make rouge a finesse fighter' do
        @character.pick_a_profession(Profession.find_by_name("Łotr").id)
        @wizard = Wizard.new(@character, "fightstyle")
        @wizard.character.fight_style_id.should == FightStyle.find_by_name("Finezyjny").id
      end
    end

    context "post" do
      before do
        setup_profession_and_origin_choices
        setup_statistics
      end

      it 'should return valid wizard instance object' do
        params = {:fight_style_id => FightStyle.find_by_name("Brutalny").id,
                  :wield_style_id => WieldStyle.find_by_name("Styl walki dwiema brońmi").id }
        @wizard = Wizard.new(@character, "fightstyle", params)
        @wizard.redirect.should == character_wizard_path(:char_id => @character.id, :step => "skills")
        @wizard.errors.should == nil
      end

      it 'should not allow to proceed without fightstyle or weapon wield selected' do
        #we have only a js validation here.
      end

      it 'should not allow to pick a fightstyle which does not coresponds to statistics' do
        params = {:fight_style_id => FightStyle.find_by_name("Finezyjny").id,
                  :wield_style_id => WieldStyle.find_by_name("Styl walki dwiema brońmi").id }
        @wizard = Wizard.new(@character, "fightstyle", params)
        @wizard.errors.should_not == nil
      end
    end
  end


  #=====================================

  def setup_profession_and_origin_choices
    profession = Profession.find_by_name("Żołnierz")
    country = Country.find_by_name("Wielkie Stepy")
    params = {:professions => profession.id, :countries => country.id, :deities => country.deities.last.id}
    @character.character_background.set_origin(params[:countries])
    @character.character_background.update_attribute(:deity_id, params[:deities])
    @character.pick_a_profession(params[:professions])
    @character.character_background.social_classes << SocialClass.find_by_name("Członek rady plemienia")
    @stats = @character.build_statistics
    @stats.draw_stats and @stats.save(:validate => false)
    @character.statistics.push_profession_modifiers
  end

  def setup_statistics
    @character.statistics.update_attributes(:strength => 30, :dexterity => 10, :polish => 10, :faith => 10, :endurance => 10, :intelligence => 10)
  end

end
