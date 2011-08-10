# -*- encoding : utf-8 -*-
class CreateOrigins < ActiveRecord::Migration
  def self.up
    create_table :origins do |t|
      t.integer :character_background_id
      t.integer :country_id
      t.timestamps
    end
  end

  def self.down
    drop_table :origins
  end
end
