# -*- encoding : utf-8 -*-
class AddAppliesToStatsChoice < ActiveRecord::Migration
  def self.up
    add_column :stats_choices, :applies_to, :string
    add_column :stats_choices, :condition, :string
  end


  def self.down
    remove_column :stats_choices, :applies_to
    remove_column :stats_choices, :condition
  end
end
