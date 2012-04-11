# -*- encoding : utf-8 -*-
class Shield < ActiveRecord::Base
  include NameWithPrice
  include CharacterCanUse

  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_shields, :dependent => :destroy
  has_many :characters, :through => :character_shields


  MULTIPLIER = {
      0 => 1,
      1 => 2,
      2 => 4,
      3 => 8
  }


end
