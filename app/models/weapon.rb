class Weapon < ActiveRecord::Base
  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_weapons, :dependent => :destroy
  has_many :characters, :through => :character_weapons

  def name_with_price
    "#{name} - #{(sprintf('%0.1f', (price.to_f / 100))).to_s.gsub(".", ",")} g"
  end

end
