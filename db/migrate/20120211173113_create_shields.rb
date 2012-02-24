class CreateShields < ActiveRecord::Migration
  def self.up
    create_table :shields do |t|
      t.string :group_name
      t.string :name
      t.integer :defense_bonus
      t.text :special_rules
      t.integer :price
      t.integer :dexterity_nerf
      t.integer :dexterity_cap
      t.timestamps
    end
  end

  def self.down
    drop_table :shields
  end
end



