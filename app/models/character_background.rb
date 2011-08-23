# -*- encoding : utf-8 -*-
class CharacterBackground < ActiveRecord::Base
  belongs_to :character
  has_and_belongs_to_many :traits
  has_and_belongs_to_many :social_classes
  has_one :origin
  has_one :country, :through => :origin

  def draw_a_trait
    if self.new_record?
      dice_roll = 1 + rand(Trait::DICE_TYPE)
      case dice_roll
        when Trait::CURSE_RANGE then
          attach_a_curse(1 + rand(Trait::DICE_TYPE))
        when Trait::BLESSING_RANGE then
          attach_a_blessing(1 + rand(Trait::DICE_TYPE))
        else
          nil
      end
    end
  end


  def attach_a_curse(num)
    traits << Trait.find_by_name(Trait::DICE_RESULT_FOR_CURSE[num])
  end

  def attach_a_blessing(num)
    traits << Trait.find_by_name(Trait::DICE_RESULT_FOR_BLESSING[num])
  end

  def draw_a_social_class
    if self.new_record?
      dice_roll = 1 + rand(Trait::DICE_TYPE)
      case dice_roll
        when Trait::CURSE_RANGE then
          attach_a_curse(1 + rand(Trait::DICE_TYPE))
        when Trait::BLESSING_RANGE then
          attach_a_blessing(1 + rand(Trait::DICE_TYPE))
        else
          nil
      end
    end
  end

  def set_origin(country_id)
    self.create_origin(:country_id => country_id)
  end

  def set_social_class
    country.c_type=="civilized" ? attach_civilized_origin : attach_barbarian_origin
    fill_the_purse_with_gold
  end

  def attach_civilized_origin
    if self.character.hardcore_social_class_picking?
      dice_roll = 1 + rand(SocialClass::DICE_TYPE)
      self.social_classes << SocialClass.find_by_name(SocialClass::DICE_RESULT___CIVILIZED[dice_roll])
    else
      self.social_classes << SocialClass.find_by_name(SocialClass.find_by_name("Mieszczanin"))
    end
  end

  def attach_barbarian_origin
    if self.character.hardcore_social_class_picking?
      dice_roll = 1 + rand(SocialClass::DICE_TYPE)
      self.social_classes << SocialClass.find_by_name(SocialClass::DICE_RESULT___BARBARIAN[dice_roll])
    else
      self.social_classes << SocialClass.find_by_name(SocialClass.find_by_name("Wojownik"))
    end
  end

  def fill_the_purse_with_gold
    #TODO test it
    sc = social_classes.first
    cooper = Purse::BASE[sc.name]
    Purse::MULTIPLIER[sc.name].times do
      cooper += ((1 + rand(Purse::DICE_TYPE)) * (sc.name=="Chłop Ubogi" or sc.name=="Wyrzutek" ? 10 : 100))
    end
    character.create_purse(:cooper => cooper)
  end

end

