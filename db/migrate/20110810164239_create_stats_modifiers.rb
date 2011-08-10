# -*- encoding : utf-8 -*-
class CreateStatsModifiers < ActiveRecord::Migration
  def self.up
    create_table :stats_modifiers do |t|
      t.integer :resource_id
      t.string :resource_type
      t.integer :strength #Siła „S”
      t.integer :dexterity #Zręczność „ZR”
      t.integer :endurance #Wytrzymałość „WT”
      t.integer :inteligence #Inteligencja „INT”
      t.integer :faith  #Wiara „WI”
      t.integer :polish #Ogłada „O”
      t.timestamps
    end
  end

  def self.down
    drop_table :stats_modifiers
  end
end
