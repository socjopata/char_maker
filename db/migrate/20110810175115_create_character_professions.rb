# -*- encoding : utf-8 -*-
class CreateCharacterProfessions < ActiveRecord::Migration
  def self.up
    create_table :character_professions do |t|
      t.integer :character_id
      t.integer :profession_id
      t.timestamps
    end
  end

  def self.down
    drop_table :character_professions
  end
end
