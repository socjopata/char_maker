# -*- encoding : utf-8 -*-
class Trait < ActiveRecord::Base
  has_and_belongs_to_many :character_backgrounds
  has_many :stats_choices, :as => :resource, :dependent => :destroy

  TRAIT_TYPE = {
      "curse" => 0,
      "blessing" => 1
  }

  CURSE_RANGE = 1..7
  BLESSING_RANGE = 24..30

  CHOICE_BREAKERS = ['Mędrzec', 'Siłacz', 'Akrobata', 'Wybraniec Boży']

  DICE_RESULT_FOR_CURSE = {
      1 => "Schizofrenik",
      2 => "Schizofrenik",
      3 => "Megaloman",
      4 => "Megaloman",
      5 => "Wyjątkowy Grubas",
      6 => "Wyjątkowy Grubas",
      7 => "Słabeusz",
      8 => "Słabeusz",
      9 => "Amnezja",
      10 => "Amnezja",
      11 => "Chromy (kulawy)",
      12 => "Chromy (kulawy)",
      13 => "Epilepsja",
      14 => "Epilepsja",
      15 => "Ryzykant",
      16 => "Ryzykant",
      17 => "Garbaty",
      18 => "Garbaty",
      19 => "Tchórz",
      20 => "Tchórz",
      21 => "Niezdara",
      22 => "Niezdara",
      23 => "Karzeł",
      24 => "Karzeł",
      25 => "Klątwa wieku",
      26 => "Niewola krwi",
      27 => "Robactwo",
      28 => "Zgnilizna",
      29 => "Albinos",
      30 => "Głupek"
  }

  DICE_RESULT_FOR_BLESSING = {
      1 => "Piękniś",
      2 => "Piękniś",
      3 => "Dar Niebios",
      4 => "Dar Niebios",
      5 => "Szósty Zmysł",
      6 => "Szósty Zmysł",
      7 => "Naturalna Odporność",
      8 => "Naturalna Odporność",
      9 => "Wzrok Durgilla",
      10 => "Wzrok Durgilla",
      11 => "Błogosławiony",
      12 => "Błogosławiony",
      13 => "Wyostrzone Zmysły",
      14 => "Wyostrzone Zmysły",
      15 => "Druga Szansa",
      16 => "Druga Szansa",
      17 => "Mędrzec",
      18 => "Mędrzec",
      19 => "Siłacz",
      20 => "Siłacz",
      21 => "Nieugięty",
      22 => "Nieugięty",
      23 => "Strzelec Wyborowy",
      24 => "Strzelec Wyborowy",
      25 => "Znamię Alaja",
      26 => "Akrobata",
      27 => "Olbrzym",
      28 => "Wybraniec Boży",
      29 => "Arcymag",
      30 => "Fechtmistrz"
  }

  DICE_TYPE = 30 #k30

  def statistics_it_affects
    stats_choices.first.stats_modifiers.first.modifies
  end

end
