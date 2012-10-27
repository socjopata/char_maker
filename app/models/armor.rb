# -*- encoding : utf-8 -*-
class Armor < ActiveRecord::Base

  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, :as => :resource, :dependent => :destroy
  has_many :stats_choices, :as => :resource, :dependent => :destroy

  has_many :character_armors, :dependent => :destroy
  has_many :characters, :through => :character_armors

  RARE_OR_EXOTIC = [  "Pancerze i Zbroje Egzotyczne", "Zbroje Płytowe"]

  def is_rare_or_exotic?
    RARE_OR_EXOTIC.include?(group_name)
  end

  EXTRA_COST = {
      0 => 0,
      1 => 10000,
      2 => 20000,
      3 => 30000
  }

end
