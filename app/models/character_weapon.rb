# -*- encoding : utf-8 -*-
class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  def resource
    weapon
  end

  def calculate_range

  end

  def calculate_speed

  end

  def calculate_damage

   end

  def hit_parameter

  end


end
