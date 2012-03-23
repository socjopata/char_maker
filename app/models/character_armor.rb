class CharacterArmor < ActiveRecord::Base
  belongs_to :character
  belongs_to :armor
end
