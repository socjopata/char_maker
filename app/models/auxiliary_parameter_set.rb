# -*- encoding : utf-8 -*-
class AuxiliaryParameterSet < ActiveRecord::Base
  belongs_to :character


  INITIATIVE = {
   "rogue" => 15,
   "soldier" => 15,
   "scholar" => 15
  }

   PERCEPTION = {
   "rogue" => 18,
   "soldier" => 12,
   "scholar" => 14
  }

   CUNNING = {
   "rogue" => 14,
   "soldier" => 10,
   "scholar" => 18
  }

   PAIN_RESISTANCE = {
   "rogue" => 10,
   "soldier" => 14,
   "scholar" => 8
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


      #t.integer :initiative  #inicjatywa
      #t.integer :perception #spostrzegawczość
      #t.integer :cunning #spryt
      #t.integer :pain_resistance #odp. na ból
      #t.integer :fear_resistance #odp na strach
      #t.integer :running #bieg
      #t.integer :hit_points #punkty życia

end
