class Weapon < ActiveRecord::Base
  has_many :armament_requirements, :as => :resource, :dependent => :destroy

  has_many :character_weapons, :dependent => :destroy
  has_many :characters, :through => :character_weapons

  MULTIPLIER = {
      0 => 1,
      1 => 2,
      2 => 4,
      3 => 8,
      4 => 16
  }

  def name_with_price
    "#{name} - #{(sprintf('%0.1f', (price.to_f / 100))).to_s.gsub(".", ",")} g"
  end

end
