class CharacterRangedWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :ranged_weapon
end
