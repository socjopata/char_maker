# -*- encoding : utf-8 -*-
class SocialClass < ActiveRecord::Base

  #TODO rewrite this...
  #to differ by type (origin)


  has_and_belongs_to_many :character_backgrounds

  DICE_TYPE = 30 #k30

  DICE_RESULT___CIVILIZED = RangedHash.new(
    1..3 => 'Niewolnik',
    4..6 => 'Chłop Ubogi',
    7..9 => 'Chłop Bogaty',
    10..14 => 'Mieszczanin Ubogi',
    15..19 => 'Mieszczanin',
    20..22 => 'Mieszczanin Bogaty',
    23..25 => 'Szlachcic Zaściankowy',
    25..28 => 'Szlachcic',
    29..30 => "Wielmoża"
  )

    DICE_RESULT___BARBARIAN = RangedHash.new(
    1..2 => 'Niewolnik',
    3..6 => 'Wyrzutek',
    7..18 => 'Wojownik',
    19..24 => 'Znany wojownik',
    25..28 => 'Członek rady plemienia',
    29..30 => 'Potomek Wodza'
  )



end
