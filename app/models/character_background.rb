# -*- encoding : utf-8 -*-
class CharacterBackground < ActiveRecord::Base
  belongs_to :character
  belongs_to :deity
  has_one :origin
  has_one :country, through: :origin
  has_and_belongs_to_many :social_classes
  has_and_belongs_to_many :traits

  def draw_a_trait
    if self.new_record?
      dice_roll = 1.d(Trait::DICE_TYPE)
      case dice_roll
        when Trait::CURSE_RANGE
          attach_a_curse(1.d(Trait::DICE_TYPE))
        when Trait::BLESSING_RANGE
          attach_a_blessing(1.d(Trait::DICE_TYPE))
        else
          nil
      end
    end
  end

  def attach_a_curse(num)
    traits << Trait.find_by_name(Trait::DICE_RESULT_FOR_CURSE_MAP[num])
  end

  def attach_a_blessing(num)
    traits << Trait.find_by_name(Trait::DICE_RESULT_FOR_BLESSING_MAP[num])
  end

  def set_origin(country_id)
    self.create_origin(country_id: country_id)
  end

  def set_social_class
    country.c_type=="civilized" ? attach_civilized_origin : attach_barbarian_origin
  end

  def attach_civilized_origin
    if Profession::DEFAULT_NOBLE.include?(character.profession.name)
      self.social_classes << SocialClass.find_by_name("Szlachcic Zaściankowy")
    else
      if character.hardcore_social_class_picking?
        dice_roll = 1.d(SocialClass::DICE_TYPE)
        self.social_classes << SocialClass.find_by_name(SocialClass::DICE_RESULT___CIVILIZED[dice_roll])
      else
        self.social_classes << SocialClass.find_by_name("Mieszczanin")
      end
    end
  end

  def attach_barbarian_origin
    if character.hardcore_social_class_picking?
      dice_roll = 1.d(SocialClass::DICE_TYPE)
      self.social_classes << SocialClass.find_by_name(SocialClass::DICE_RESULT___BARBARIAN[dice_roll])
    else
      self.social_classes << SocialClass.find_by_name("Wojownik")
    end
  end

  def fill_the_purse_with_gold
    sc = social_classes.first
    starting = Purse::BASE_MAP[sc.name]
    Purse::MULTIPLIER_MAP[sc.name].times do
      starting += ((1.d(Purse::DICE_TYPE)) * ((sc.name=="Chłop Ubogi" || sc.name=="Wyrzutek") ? 10 : 100))
    end
    character.create_purse(starting: starting, base: 5000)
  end
end