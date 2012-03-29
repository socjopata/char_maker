class Armor < ActiveRecord::Base
  include NameWithPrice

  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_armors, :dependent => :destroy
  has_many :characters, :through => :character_armors



end
