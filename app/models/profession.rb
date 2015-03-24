# -*- encoding : utf-8 -*-
class Profession < ActiveRecord::Base
  DEFAULT_NOBLE = ["Fircyk (żołnierz)", "Fircyk (łotr)", "Rycerz", "Rycerz Zakonny"]
  CASTER_CLASSES = ["Mag", "Kapłan", "Szaman", "Czarnoksiężnik", "Alchemik"]
  CLERIC_CLASSES = ["Kapłan", "Szaman"]
  NON_CASTER_CLASSES = ["Dyplomata"]

  has_and_belongs_to_many :countries

  has_many :stats_choices, as: :resource, dependent: :destroy
  has_many :characters, through: :character_professions
  has_many :character_professions
  has_many :lead_parameters

  validates_uniqueness_of :name
end
