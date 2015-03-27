# -*- encoding : utf-8 -*-
class Spell < ActiveRecord::Base
  belongs_to :profession
  belongs_to :deity

  has_many :spellbooks, through: :spellbook_spells
  has_many :spellbook_spells
  has_many :spell_requirements, dependent: :destroy

  scope :mage, -> { where(profession_id: Profession.find_by_name("Mag").id) }
  scope :warlock, -> { where(profession_id: Profession.find_by_name("Czarnoksiężnik").id) }
  scope :alchemist, -> { fetch_for_level("1").where(:profession_id => Profession.find_by_name("Alchemik").id) } #TODO Look here in case we have more levels than 1
  scope :cleric, ->(deity_id) { where(profession_id: Profession.find_by_name("Kapłan").id, deity_id: deity_id) }
  scope :shaman, ->(deity_id) { where(profession_id: Profession.find_by_name("Szaman").id, deity_id: deity_id) }

  scope :fetch_for_level, ->(level) { joins(:spell_requirements).where("spell_requirements.check_applies_to = 'experience' AND  spell_requirements.value = ?", level) }

  def to_s
    name
  end

  def self.set_for(character)
    case character.profession.name
      when "Mag"
        Spell.mage
      when "Szaman"
        Spell.shaman(character.character_background.deity.id)
      when "Kapłan"
        Spell.cleric(character.character_background.deity.id)
      when "Czarnoksiężnik"
        Spell.warlock
      when "Alchemik"
        Spell.alchemist
    end
  end
end
