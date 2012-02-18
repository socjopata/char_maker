# -*- encoding : utf-8 -*-
class CreatePurses < ActiveRecord::Migration
  def self.up
    create_table :purses do |t|
      t.integer :character_id
      t.integer :starting    # 10c = 1s; 10s = 1g; 10g = 1p
      t.integer :current #with bonuses
      t.integer :base #which is basicaly 50gold available for character creation
      t.timestamps
    end
  end

  def self.down
    drop_table :purses
  end
end
