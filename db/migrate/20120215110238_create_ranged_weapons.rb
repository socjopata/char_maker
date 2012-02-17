class CreateRangedWeapons < ActiveRecord::Migration
  def self.up
    create_table :ranged_weapons do |t|
      t.string :group_name
      t.string :name
      t.string :weapon_type
      t.string :range
      t.string :speed
      t.integer :dmg
      t.string :dmg_type # like crushing or piercing
      t.integer :accuracy_bonus
      t.text :special_rules
      t.integer :price
      t.integer :reload_time
      t.timestamps
    end
  end

  def self.down
    drop_table :ranged_weapons
  end
end
