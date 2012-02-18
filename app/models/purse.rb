# -*- encoding : utf-8 -*-
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


  #TODO OMG. Test it and refactor
  def update_current
    money_bonuses = character.statistics.stats_modifiers
    money_bonuses_requiring_dice_rolls = money_bonuses.select { |sm| sm.group_name!="domyslne" }
    money_bits = []
    if money_bonuses_requiring_dice_rolls.present?
      money_bonuses_requiring_dice_rolls.map(&:group_name).each do |dsl_code|
        dice_instruction = dsl_code.match /(\d\w\d+)/
        base, static = dsl_code.gsub(dice_instruction, "").split("+")
        money_bits << static.to_i
        number_of_rolls, dice_type = dice_instruction.split("k").tap { |element| element.to_i }
        number_of_rolls.times do
          multiplier = case base
                         when "g" then
                           100
                         when "s" then
                           10
                         when "c" then
                           1
                       end
          money_bits << ((1 + rand(dice_type)) * multiplier)
        end
      end
    end
    update_attribute(:current, (starting + money_bonuses.collect(&:value).sum + money_bits.flatten))
  end

end
