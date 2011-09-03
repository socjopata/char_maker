# -*- encoding : utf-8 -*-
class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :name
      t.text :description
      t.string :general_type
      t.timestamps
    end
  end

  def self.down
    drop_table :professions
  end
end
