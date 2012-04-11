# -*- encoding : utf-8 -*-
class CharacterArmor < ActiveRecord::Base
  belongs_to :character
  belongs_to :armor

  def resource
    armor
  end

end
