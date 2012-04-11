class CreateCharacterRangedWeapons < ActiveRecord::Migration
  def self.up
    create_table :character_ranged_weapons do |t|
      t.integer :character_id
      t.integer :ranged_weapon_id
      t.boolean :speed
      t.boolean :damage
      t.boolean :attack_bonus #accuracy
      t.boolean :range
      t.timestamps
    end
  end

  def self.down
    drop_table :character_ranged_weapons
  end
end
