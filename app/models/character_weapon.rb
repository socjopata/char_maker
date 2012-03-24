class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  def resource
    weapon
  end
end
