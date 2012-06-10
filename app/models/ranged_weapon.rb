# -*- encoding : utf-8 -*-
class RangedWeapon < ActiveRecord::Base
  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_ranged_weapons, :dependent => :destroy
  has_many :characters, :through => :character_ranged_weapons

  BOWS = ["Strzelecka Łuki Proste", "Strzelecka Łuki Refleksyjne"]
  SLINGS = ["Miotana Proce"]

  MULTIPLIER = {
      0 => 1,
      1 => 2,
      2 => 4,
      3 => 8,
      4 => 16
  }

  def is_a_bow?
    BOWS.include?(group_name)
  end

  def is_a_sling?
    SLINGS.include?(group_name)
  end

end
