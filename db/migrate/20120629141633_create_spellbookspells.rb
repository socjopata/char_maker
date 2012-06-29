class CreateSpellbookspells < ActiveRecord::Migration
  def self.up
    create_table :spellbook_spells do |t|
      t.integer :spellbook_id
      t.integer :spell_id
      t.timestamps
    end
  end

  def self.down
    drop_table :spellbook_spells
  end
end
