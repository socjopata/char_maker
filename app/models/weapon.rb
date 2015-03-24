# -*- encoding : utf-8 -*-
class Weapon < ActiveRecord::Base
  MULTIPLIER_MAP = {
      0 => 1,
      1 => 2,
      2 => 4,
      3 => 8,
      4 => 16
  }

  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, as: :resource, dependent: :destroy
  has_many :stats_choices, as: :resource, dependent: :destroy
  has_many :character_weapons, dependent: :destroy
  has_many :characters, through: :character_weapons
end