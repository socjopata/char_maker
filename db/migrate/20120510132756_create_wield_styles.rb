# -*- encoding : utf-8 -*-
class CreateWieldStyles < ActiveRecord::Migration
  def self.up
    create_table :wield_styles do |t|
      t.string :name
      t.timestamps
    end
    add_column :characters, :wield_style_id, :integer

  end

  def self.down
    drop_table :wield_styles
    remove_column :characters, :wield_style_id
  end
end



