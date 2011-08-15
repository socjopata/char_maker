# -*- encoding : utf-8 -*-
class StatsModifier < ActiveRecord::Base

belongs_to :stats_choice

#TODO make a habtm relation table with character or statistic - a possible implementation choice
end
