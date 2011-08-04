# -*- encoding : utf-8 -*-
class SocialClass < ActiveRecord::Base
 #TODO ask Artur if he wants description of a social class presented somewhere
 #TODO ask Artur about barbarian and not barbarian social classes   !!!

  has_and_belongs_to_many :character_backgrounds

  DICE_TYPE = 30 #k30
  DICE_RESULT = {
  1 => "Niewolnik",
  2 => "Niewolnik",
  3 => "Niewolnik",
  4 => "Chłop Ubogi",
  5 => "Chłop Ubogi",
  6 => "Chłop Ubogi",
  7 => "Chłop Bogaty",
  8 => "Chłop Bogaty",
  9 => "Chłop Bogaty",
  10 => "Mieszczanin Ubogi",
  11 => "Mieszczanin Ubogi",
  12 => "Mieszczanin Ubogi",
  13 => "Mieszczanin Ubogi",
  14 => "Mieszczanin Ubogi",
  15 => "Mieszczanin",
  16 => "Mieszczanin",
  17 => "Mieszczanin",
  18 => "Mieszczanin",
  19 => "Mieszczanin",
  20 => "Mieszczanin Bogaty",
  21 => "Mieszczanin Bogaty",
  22 => "Mieszczanin Bogaty",
  23 => "Szlachcic Zaściankowy",
  24 => "Szlachcic Zaściankowy",
  25 => "Szlachcic Zaściankowy",
  26 => "Szlachcic",
  27 => "Szlachcic",
  28 => "Szlachcic",
  29 => "Wielmoża",
  30 => "Wielmoża"
  }

end
