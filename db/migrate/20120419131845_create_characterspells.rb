# -*- encoding : utf-8 -*-
class CreateCharacterspells < ActiveRecord::Migration
  def self.up
    create_table :character_spells do |t|
      t.integer :character_id
      t.integer :spell_id
      t.boolean :starter #<--cannot be unchecked
      t.timestamps
    end
  end

  def self.down
    drop_table :character_spells
  end
end
