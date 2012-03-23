class Shield < ActiveRecord::Base
  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_shields, :dependent => :destroy
  has_many :characters, :through => :character_shields


end
