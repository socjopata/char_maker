class CharacterShield < ActiveRecord::Base
  belongs_to :character
  belongs_to :shield
end
