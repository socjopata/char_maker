class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon
end
