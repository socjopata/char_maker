# -*- encoding : utf-8 -*-
class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :name
      t.integer :profession_id
      t.integer :deity_id
      t.integer :index
      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
