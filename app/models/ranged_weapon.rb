class RangedWeapon < ActiveRecord::Base
  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_ranged_weapons, :dependent => :destroy
  has_many :characters, :through => :character_ranged_weapons
end
