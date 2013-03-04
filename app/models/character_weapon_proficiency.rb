# -*- encoding : utf-8 -*-
class CharacterWeaponProficiency < ActiveRecord::Base
  self.table_name = "character_weapon_proficiencies"

  belongs_to :character
  validates_uniqueness_of :name, :scope => :character_id
end
