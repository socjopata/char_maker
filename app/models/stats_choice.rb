class StatsChoice < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_many :stats_modifiers, :dependent => :destroy
end
