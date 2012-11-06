# -*- encoding : utf-8 -*-
class Profession < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_and_belongs_to_many :countries
  has_many :characters, :through => :character_professions
  has_many :character_professions
  has_many :lead_parameters


  validates_uniqueness_of :name

  DEFAULT_NOBLE = ["Fircyk (żołnierz)", "Fircyk (łotr)", "Rycerz", "Rycerz Zakonny"]

  CASTER_CLASSES = ["Mag", "Kapłan", "Szaman", "Czarnoksiężnik", "Alchemik"]
  CLERIC_CLASSES = ["Kapłan", "Szaman"]
  NON_CASTER_CLASSES = ["Dyplomata"]

  #after pushing all check for doubles
  #while rendering add extra check for choice.

  #all skills, auxilairy parameters will be set as stats schoice
end
