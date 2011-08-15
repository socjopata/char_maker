# -*- encoding : utf-8 -*-
class Country < ActiveRecord::Base
    has_and_belongs_to_many :professions
    has_many :origins
    has_many :character_backgrounds, :through => :origins
    #TODO stats modifiers...
end
