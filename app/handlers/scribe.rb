class Scribe

   attr_reader :class_spells, :character_spellbook

  def initialize(character)
     @character_spellbook = Spellbook.find_or_create_by_character_id(character.id)
     @class_spells = Spell.set_for(character)
  end




end