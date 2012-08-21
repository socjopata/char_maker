class Scribe

  attr_accessor :class_spells, :character_spellbook, :spells_left, :not_enough_free_spell_points

  def initialize(character)
    @character_spellbook = Spellbook.find_or_create_by_character_id(character.id)
    @class_spells = Spell.set_for(character)
    @spells_left = calculate_spells_left
  end


  def calculate_spells_left
    5 - @character_spellbook.randomly_drawn_spells.size - @character_spellbook.picked_by_player #TODO + bonuses from skills
  end

  def learn_spell(id, choice)
    if choice=="true"
      if user_allowed_to_pick_another_spell?
        #add a spell
        SpellbookSpell.create(:spellbook_id => @character_spellbook.id, :spell_id => id)
      else
        @not_enough_free_spell_points = true
      end
    else
      #remove a spell
      @character_spellbook.spellbook_spells.where(:spell_id => id).first.destroy
    end

    @character_spellbook.reload
    @spells_left = calculate_spells_left
  end

  def user_allowed_to_pick_another_spell?
    @spells_left > 0
  end

  def complete_spellbook
    @character_spellbook.update_attributes(:mana_points => @character_spellbook.character.statisctics.calculate_mana_points)
  end

end


