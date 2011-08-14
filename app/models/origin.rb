# -*- encoding : utf-8 -*-
class Origin < ActiveRecord::Base
  belongs_to :character_background
  belongs_to :country

    def to_s
    self.country.name
    end

  end
