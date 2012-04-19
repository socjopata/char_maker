# -*- encoding : utf-8 -*-
class CreateStatsModifiers < ActiveRecord::Migration
  def self.up
    create_table :stats_modifiers do |t|
      t.integer :stats_choice_id
      t.string :modifies
      t.integer :value
      t.string :evaluated_instruction  #finally
      t.string :group_name
      t.boolean :default_for_social_class#, :default => false
      t.boolean :default_for_origin
      t.timestamps
    end
  end

  def self.down
    drop_table :stats_modifiers
  end
end
