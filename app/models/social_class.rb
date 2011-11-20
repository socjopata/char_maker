# -*- encoding : utf-8 -*-
class SocialClass < ActiveRecord::Base

  has_many :stats_choices, :as => :resource, :dependent => :destroy
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
    29..30 => 'Wielmoża'
  )

    DICE_RESULT___BARBARIAN = RangedHash.new(
    1..2 => 'Niewolnik barbarzyński',
    3..6 => 'Wyrzutek',
    7..18 => 'Wojownik',
    19..24 => 'Znany wojownik',
    25..28 => 'Członek rady plemienia',
    29..30 => 'Potomek Wodza'
  )

  def is_noble?
    ['Szlachcic Zaściankowy', 'Szlachcic', 'Wielmoża', 'Członek rady plemienia', 'Potomek Wodza'].include?(name)
  end

  def non_peasant
    ['Mieszczanin Ubogi', 'Mieszczanin', 'Mieszczanin Bogaty', 'Wojownik', 'Znany wojownik', 'Szlachcic Zaściankowy', 'Szlachcic', 'Wielmoża', 'Członek rady plemienia', 'Potomek Wodza'].include?(name)
  end

  def non_barbarian
     ['Niewolnik barbarzyński', 'Chłop Ubogi', 'Chłop Bogaty',
     'Mieszczanin Ubogi',  'Mieszczanin',   'Mieszczanin Bogaty',
     'Szlachcic Zaściankowy',    'Szlachcic',     'Wielmoża'].include?(name)
  end

  #Magic.
  def true
    true
  end


end
