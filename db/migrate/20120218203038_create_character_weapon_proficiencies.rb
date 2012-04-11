# -*- encoding : utf-8 -*-
class CreateCharacterWeaponProficiencies < ActiveRecord::Migration
  def self.up
    create_table :character_weapon_proficiencies do |t|
      t.integer :character_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :character_weapon_proficiencies
  end
end
