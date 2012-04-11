# -*- encoding : utf-8 -*-
class ArmamentRequirement < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true

  def is_met_by?(character, statistics_hash)
    case self.check_applies_to
      when "statistics"
        value.to_i > statistics_hash[name]
      when "fightstyle"
        character.fight_style.name==name
      when "modified_stat"
        #TODO zrecznosc aktualna case
      when "social_class"
        character.social_class.send(self.name.intern) #usage ...(:check_applies_to => "social_class", :name => "is_elite?")
      when "origin"
        character.character_background.country.name == self.name
    end

  end

end


#usage
#item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )
#item.armament_requirements.create(:check_applies_to => "statistics", :name => "dexterity", :value => "25" )
#item.armament_requirements.create(:check_applies_to => "modified_stat", :name => "actual_dexterity", :value => "25" ) TODO
#item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")
#item.armament_requirements.create(:check_applies_to => "origin", :name => "Alantar")

