# -*- encoding : utf-8 -*-
class Profession < ActiveRecord::Base
  has_one :stats_modifier, :as => :resource, :dependent => :destroy
  has_and_belongs_to_many :countries
  has_many :characters, :through => :character_professions
  has_many :character_professions

  validates_uniqueness_of :name
end
