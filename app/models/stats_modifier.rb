# -*- encoding : utf-8 -*-
class StatsModifier < ActiveRecord::Base
belongs_to :resource, :polymorphic => true
end
