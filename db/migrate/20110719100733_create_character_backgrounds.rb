# -*- encoding : utf-8 -*-
class CreateCharacterBackgrounds < ActiveRecord::Migration
  def self.up
    create_table :character_backgrounds do |t|
      t.integer :character_id
      t.timestamps
    end
  end

  def self.down
    drop_table :character_backgrounds
  end
end
