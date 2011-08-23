class Purse < ActiveRecord::Base
  belongs_to :character

  DICE_TYPE = 20 #k20

  BASE =
      {
      'Niewolnik' => 0,
      'Niewolnik barbarzyński' => 0,
      'Chłop Ubogi' => 0,
      'Chłop Bogaty' => 2000,
      'Mieszczanin Ubogi' => 1000,
      'Mieszczanin' => 5000,
      'Mieszczanin Bogaty' => 50000,
      'Szlachcic Zaściankowy' => 5000,
      'Szlachcic' => 200000,
      'Wielmoża' => 350000,
      'Wyrzutek' => 0,
      'Wojownik' => 1000,
      'Znany wojownik' => 5000,
      'Członek rady plemienia' => 10000,
      'Potomek Wodza' => 100000
  }

  MULTIPLIER = {
      'Niewolnik' => 0,
      'Niewolnik barbarzyński' => 0,
      'Chłop Ubogi' => 2,
      'Chłop Bogaty' => 1,
      'Mieszczanin Ubogi' => 1,
      'Mieszczanin' => 2,
      'Mieszczanin Bogaty' => 5,
      'Szlachcic Zaściankowy' => 1,
      'Szlachcic' => 0,
      'Wielmoża' => 0,
      'Wyrzutek' => 1,
      'Wojownik' => 1,
      'Znany wojownik' => 1,
      'Członek rady plemienia' => 2,
      'Potomek Wodza' => 0
  }




end
