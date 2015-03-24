# -*- encoding : utf-8 -*-
class Armor < ActiveRecord::Base
  RARE_OR_EXOTIC = ["Pancerze i Zbroje Egzotyczne", "Zbroje Płytowe"]
  EXTRA_COST_MAP = {
      0 => 0,
      1 => 10000,
      2 => 20000,
      3 => 30000
  }

  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, as: :resource, dependent: :destroy
  has_many :stats_choices, as: :resource, dependent: :destroy
  has_many :character_armors, dependent: :destroy
  has_many :characters, through: :character_armors

  def is_rare_or_exotic?
    RARE_OR_EXOTIC.include?(group_name)
  end
end
