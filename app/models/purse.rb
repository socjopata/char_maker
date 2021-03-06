# -*- encoding : utf-8 -*-
class Purse < ActiveRecord::Base
  DICE_TYPE = 20 #k20
  BASE_MAP =
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

  MULTIPLIER_MAP = {
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

  belongs_to :character

  def close_the_bill(amount_after_shopping)
    amount_after_shopping < current ? update_attribute(:base, amount_after_shopping) : update_attribute(:base, current)
  end

  def update_current
    money_bonuses = character.statistics.stats_modifiers.select { |sm| sm.modifies=="money" }
    money_bonuses_requiring_dice_rolls = money_bonuses.select { |sm| sm.group_name!="domyślne" }
    variable_part = parse_variable_part(money_bonuses_requiring_dice_rolls)
    update_attribute(:current, (starting + money_bonuses.collect(&:value).sum + variable_part))
    current + base
  end

  def parse_variable_part(money_bonuses_requiring_dice_rolls)
    money_bits = []
    money_bonuses_requiring_dice_rolls.map(&:group_name).each do |dsl_code|
      dice_instruction = dsl_code.match(/(\d\w\d+)/)[0]
      base, static = dsl_code.gsub(dice_instruction, "").split("+")
      money_bits << static.to_i
      number_of_rolls, dice_type = dice_instruction.split("k").map(&:to_i)
      multiplier = extract_multiplier(base)
      number_of_rolls.times do
        money_bits << ((1.d(dice_type)) * multiplier)
      end
    end
    money_bits.flatten.sum
  end

  def extract_multiplier(base)
    case base
      when "g"
        100
      when "s"
        10
      when "c"
        1
    end
  end
end