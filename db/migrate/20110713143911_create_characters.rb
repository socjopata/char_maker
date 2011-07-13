class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :gender
      t.string :character_class
      t.string :alignment
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
