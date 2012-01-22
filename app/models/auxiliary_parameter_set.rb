# -*- encoding : utf-8 -*-
class AuxiliaryParameterSet < ActiveRecord::Base
  belongs_to :character

  ENGLISH_NAMES = {
      "Odporność na Ból" => "pain_resistance",
      "Odporność na Strach" => "fear_resistance",
      "Punkty Życia" => "life_points",
      "Odporność na Magię" => "magic_resistance",
      "Bieg" => "running",
      "Spostrzegawczość" => "perception",
      "Inicjatywa" => "initiative"
  }

  INITIATIVE = {
   "rogue" => 15,
   "soldier" => 15,
   "scholar" => 15
  }

   PERCEPTION = {
   "rogue" => 18,
   "soldier" => 10,
   "scholar" => 15
  }

   PAIN_RESISTANCE = {
   "rogue" => 10,
   "soldier" => 12,
   "scholar" => 10
  }

   FEAR_RESISTANCE = {
   "rogue" => 8,
   "soldier" => 12,
   "scholar" => 10
  }

   RUNNING = {
   "rogue" => 10,
   "soldier" => 10,
   "scholar" => 10
  }

   HIT_POINTS = {
   "rogue" => 14,
   "soldier" => 16,
   "scholar" => 12
  }

   MAGIC_RESISTANCE = {
   "rogue" => 0,
   "soldier" => 0,
   "scholar" => 3
  }


      #t.integer :initiative  #inicjatywa
      #t.integer :perception #spostrzegawczość

      #t.integer :pain_resistance #odp. na ból
      #t.integer :fear_resistance #odp na strach
      #t.integer :running #bieg
      #t.integer :hit_points #punkty życia

end
