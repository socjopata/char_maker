class StatisticsStatsModifiersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :statistics_stats_modifiers, :id => false do |t|
      t.integer :statistics_id
      t.integer :stats_modifier_id
    end
  end

  def self.down
    drop_table :statistics_stats_modifiers
  end
end
