class Spellbook < ActiveRecord::Base
  belongs_to :character

  has_many :spells, :through => :spellbook_spells
  has_many :spellbook_spells

  serialize :randomly_drawn_spells
  DICE_TYPE = 30 #k30

  after_create :draw_spells

  def draw_spells
      spell_indexes = [*1..30].sample(5)
      spells = Spell.set_for(character).select {|s| spell_indexes.include?(s.index) }

      spells.each do |spell|
        SpellbookSpell.create(:spellbook_id => self.id, :spell_id => spell.id)
      end

      update_attribute(:randomly_drawn_spells, spell_indexes.select{ |si| (si < 21)} )
  end

end
