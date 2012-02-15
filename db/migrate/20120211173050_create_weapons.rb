class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table :weapons do |t|
      t.string :group_name
      t.string :name
      t.string :weapon_type
      t.string :range
      t.string :speed
      t.integer :cutting_dmg
      t.integer :pierce_dmg
      t.integer :crushing_dmg
      t.integer :attack_bonus
      t.integer :defense_bonus
      t.text :special_rules
      t.integer :price
      t.timestamps
    end
  end

  def self.down
    drop_table :weapons
  end
end
