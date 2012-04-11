# -*- encoding : utf-8 -*-
class CharacterRangedWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :ranged_weapon

  def resource
    ranged_weapon
  end

end
