class Spell < ActiveRecord::Base
  belongs_to :profession
  belongs_to :deity

  has_many :character_spells
  has_many :characters, :through => :character_spells

end
