# -*- encoding : utf-8 -*-
class CreateArmors < ActiveRecord::Migration
  def self.up
    create_table :armors do |t|
      t.string :group_name
      t.string :name
      t.string :armor_type
      t.text :special_rules
      t.integer :price
      t.integer :dexterity_nerf
      t.integer :dexterity_cap
      t.integer :protection_from_cutting
      t.integer :protection_from_piercing
      t.integer :protection_from_crushing
      t.timestamps
    end
  end

  def self.down
    drop_table :armors
  end
end
