# -*- encoding : utf-8 -*-
class Scribe
  attr_accessor :class_spells, :character_spellbook, :spells_left, :not_enough_free_spell_points
  attr_reader :character

  def initialize(character)
    @character = character
    @character_spellbook = Spellbook.where(character_id: character.id).first_or_create
    @class_spells = Spell.set_for(character)
    @spells_left = character.is_of_scholar_class_type? ? calculate_spells_left : 0
  end

  def calculate_spells_left
    5 - @character_spellbook.randomly_drawn_spells.size - @character_spellbook.picked_by_player +
        character.statistics.calculate_amount_of_extra_spells +
        character.statistics.trait_modifier_for_auxiliary_parameter_named("Dodatkowe zaklęcia")
  end

  def learn_spell(id, choice)
    if choice == "true"
      if user_allowed_to_pick_another_spell?
        #add a spell
        SpellbookSpell.create(spellbook_id: @character_spellbook.id, spell_id: id)
      else
        @not_enough_free_spell_points = true
      end
    else
      #remove a spell
      @character_spellbook.spellbook_spells.where(spell_id: id).first.destroy
    end

    @character_spellbook.reload
    @spells_left = calculate_spells_left
  end

  def user_allowed_to_pick_another_spell?
    @spells_left > 0
  end

  def complete_spellbook
    @character_spellbook.update_attributes(mana_points: character.statistics.calculate_mana_points)
  end
end