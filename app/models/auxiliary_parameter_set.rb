# -*- encoding : utf-8 -*-
class AuxiliaryParameterSet < ActiveRecord::Base
  ENGLISH_NAMES_MAP = {
      "Odporność na Ból" => "pain_resistance",
      "Odporność na Strach" => "fear_resistance",
      "Punkty Życia" => "life_points",
      "Odporność na Magię" => "magic_resistance",
      "Bieg" => "running",
      "Spostrzegawczość" => "perception",
      "Inicjatywa" => "initiative"
  }
  INITIATIVE_MAP = {
   "rogue" => 15,
   "soldier" => 15,
   "scholar" => 15
  }
  PERCEPTION_MAP = {
   "rogue" => 18,
   "soldier" => 10,
   "scholar" => 15
  }
  PAIN_RESISTANCE_MAP = {
   "rogue" => 10,
   "soldier" => 12,
   "scholar" => 10
  }
  FEAR_RESISTANCE_MAP = {
   "rogue" => 8,
   "soldier" => 12,
   "scholar" => 10
  }
  RUNNING_MAP = {
   "rogue" => 10,
   "soldier" => 10,
   "scholar" => 10
  }
  HIT_POINTS_MAP = {
   "rogue" => 14,
   "soldier" => 16,
   "scholar" => 12
  }
  MAGIC_RESISTANCE_MAP = {
   "rogue" => 0,
   "soldier" => 0,
   "scholar" => 3
  }

  belongs_to :character
end