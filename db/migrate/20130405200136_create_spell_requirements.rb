class CreateSpellRequirements < ActiveRecord::Migration
  def change
    create_table :spell_requirements do |t|
      t.string :check_applies_to
      t.string :eval_code
      t.integer :skill_id
      t.timestamps
    end
  end
end
