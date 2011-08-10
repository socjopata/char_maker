# -*- encoding : utf-8 -*-
class CharactersProfessions < ActiveRecord::Migration
  def self.up
    create_table :characters_professions, :id => false do |t|
      t.integer :character_id
      t.integer :profession_id
    end
  end

  def self.down
    drop_table :characters_professions
  end
end
