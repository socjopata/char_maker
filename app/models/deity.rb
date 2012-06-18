class Deity < ActiveRecord::Base
  has_and_belongs_to_many :countries

  def to_s
    name
  end

end
