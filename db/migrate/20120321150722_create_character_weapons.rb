# -*- encoding : utf-8 -*-
class CreateCharacterWeapons < ActiveRecord::Migration
  def self.up
    create_table :character_weapons do |t|
      t.integer :character_id
      t.integer :weapon_id
      t.boolean :speed
      t.boolean :damage
      t.boolean :attack_bonus
      t.boolean :defense_bonus
      t.timestamps
    end
  end

  def self.down
    drop_table :character_weapons
  end
end
