class Trait < ActiveRecord::Base
  has_and_belongs_to_many :character_backgrounds

  TRAIT_TYPE = {
        "curse"          => 0,
        "blessing" => 1
    }

   CURSE_RANGE = 1..7
   BLESSING_RANGE = 24..30

  DICE_RESULT_FOR_CURSE = {
  1 => "Schizofrenik",
  2 => "Schizofrenik",
  3 => "",
  4 => "",
  5 => "",
  6 => "",
  7 => "",
  8 => "",
  9 => "",
  10 => "",
  11 => "",
  12 => "",
  13 => "",
  14 => "",
  15 => "",
  16 => "",
  17 => "",
  18 => "",
  19 => "",
  20 => "",
  21 => "",
  22 => "",
  23 => "",
  24 => "",
  25 => "",
  26 => "",
  27 => "",
  28 => "",
  29 => "",
  30 => ""
  }

  DICE_RESULT_FOR_BLESSING = {
  1 => "Piękniś",
  2 => "Dar Niebios",
  3 => "",
  4 => "",
  5 => "",
  6 => "",
  7 => "",
  8 => "",
  9 => "",
  10 => "",
  11 => "",
  12 => "",
  13 => "",
  14 => "",
  15 => "",
  16 => "",
  17 => "",
  18 => "",
  19 => "",
  20 => "",
  21 => "",
  22 => "",
  23 => "",
  24 => "",
  25 => "",
  26 => "",
  27 => "",
  28 => "",
  29 => "",
  30 => ""
  }

  DICE_TYPE = 30 #k30

end
