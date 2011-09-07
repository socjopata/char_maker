# -*- encoding : utf-8 -*-
class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :name
      t.text :description
      t.string :general_type
      t.integer :skill_points
      t.integer :attack
      t.integer :defense
      t.integer :shooting
      t.integer :starting_weapon_proficiency
      t.string :preferred_weapon_proficiency
      t.string :available_armors
      t.timestamps
    end
  end

  def self.down
    drop_table :professions
  end
end
