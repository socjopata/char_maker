# -*- encoding : utf-8 -*-
class Spell < ActiveRecord::Base
  belongs_to :profession
  belongs_to :deity

  has_many :spellbooks, :through => :spellbook_spells
  has_many :spellbook_spells

  scope :mage, where(:profession_id => Profession.find_by_name("Mag").id)
  scope :warlock, where(:profession_id => Profession.find_by_name("Czarnoksiężnik").id)
  scope :alchemist, where(:profession_id => Profession.find_by_name("Alchemik").id)

  def self.set_for(character)
    case character.profession.name
      when "Mag"
        Spell.mage
      when "Szaman"

      when "Kapłan"

      when "Czarnoksiężnik"
        Spell.warlock
      when "Alchemik"
        Spell.alchemist
    end

  end

end
