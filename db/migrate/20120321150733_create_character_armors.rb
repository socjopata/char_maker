class CreateCharacterArmors < ActiveRecord::Migration
  def self.up
    create_table :character_armors do |t|
      t.integer :character_id
      t.integer :armor_id
      t.boolean :dexterity_nerf
      t.boolean :dexterity_cap
      #TODO
      t.timestamps
    end
  end

  def self.down
    drop_table :character_armors
  end
end
