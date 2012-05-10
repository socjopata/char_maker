class WieldStyle < ActiveRecord::Base
  has_many :characters
  validates_presence_of :name
end
