# -*- encoding : utf-8 -*-
class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :gender
      t.boolean :finished #temporary solution i think, before introducing state_machine
      t.integer :free_skill_points_left
      t.boolean :easy_deity_picking, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
