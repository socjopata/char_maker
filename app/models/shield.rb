# -*- encoding : utf-8 -*-
class Shield < ActiveRecord::Base
  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, :as => :resource, :dependent => :destroy
  has_many :stats_choices, :as => :resource, :dependent => :destroy

  has_many :character_shields, :dependent => :destroy
  has_many :characters, :through => :character_shields

  def ranged_defense_bonus
    if  stats_choices.first
      bonus = stats_choices.first.stats_modifiers.where(:group_name => "Obrona Daleka").first and bonus.try(:value)
    else
      0
    end
  end

  MULTIPLIER = {
      0 => 1,
      1 => 2,
      2 => 4,
      3 => 8
  }


end
