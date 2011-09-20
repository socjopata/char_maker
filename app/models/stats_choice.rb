# -*- encoding : utf-8 -*-
class StatsChoice < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_many :stats_modifiers, :dependent => :destroy

  def self.default
    find_by_resource_id(0)
  end
end
