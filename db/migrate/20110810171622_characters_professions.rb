# -*- encoding : utf-8 -*-
class CharactersProfessions < ActiveRecord::Migration
  def self.up
    create_table :countries_professions, :id => false do |t|
      t.integer :country_id
      t.integer :profession_id
    end
  end

  def self.down
    drop_table :countries_professions
  end
end
