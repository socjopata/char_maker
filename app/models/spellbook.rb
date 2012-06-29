class Spellbook < ActiveRecord::Base
  belongs_to :character

  has_many :spells, :through => :spellbook_spells
  has_many :spellbook_spells

  serialize :randomly_drawn_spells

  after_create :draw_spells

  def draw_spells

  end

end
