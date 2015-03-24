# -*- encoding : utf-8 -*-
class Country < ActiveRecord::Base
    has_and_belongs_to_many :professions
    has_and_belongs_to_many :deities

    has_many :origins
    has_many :character_backgrounds, through: :origins
    has_many :stats_choices, as: :resource, dependent: :destroy
end