class CreateSpellRequirements < ActiveRecord::Migration
  def self.up
    add_column :spells, :description, :text
    create_table :spell_requirements do |t|
      t.string :check_applies_to
      t.string :eval_code
      t.integer :spell_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    remove_column :spells, :description
    drop_table :spell_requirements
  end
end
