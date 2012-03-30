class CreateCharacterShields < ActiveRecord::Migration
  def self.up
    create_table :character_shields do |t|
      t.integer :character_id
      t.integer :shield_id
      t.boolean :dexterity_nerf
      t.boolean :dexterity_cap
      t.boolean :defense_bonus
      t.boolean :favorite
      t.timestamps
    end
  end

  def self.down
    drop_table :character_shields
  end
end
