class Weapon < ActiveRecord::Base
  has_many :armament_requirements, :as => :resource, :dependent => :destroy
end
