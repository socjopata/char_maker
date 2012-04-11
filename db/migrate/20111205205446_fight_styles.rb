# -*- encoding : utf-8 -*-
class FightStyles < ActiveRecord::Migration
  def self.up
    create_table :fight_styles do |t|
      t.string :name
      t.timestamps
    end
    add_column :characters, :fight_style_id, :integer
  end

  def self.down
    drop_table :fight_styles
    remove_column :characters, :fight_style_id
  end
end
