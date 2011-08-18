# -*- encoding : utf-8 -*-
class CreateStatsChoices < ActiveRecord::Migration
  def self.up
    create_table :stats_choices do |t|
      t.integer :resource_id
      t.string :resource_type
      t.timestamps
    end
  end

  def self.down
    drop_table :stats_choices
  end
end
