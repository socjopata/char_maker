class CreateSpellbooks < ActiveRecord::Migration
  def self.up
    create_table :spellbooks do |t|
      t.references :character
      t.text :randomly_drawn_spells #these are indexes, not ids
      t.timestamps
    end
  end

  def self.down
    drop_table :spellbooks
  end
end
