class CreateSkillBonusPreferences < ActiveRecord::Migration
  def self.up
    create_table :skill_bonus_preferences do |t|
      t.integer :character_skill_id
      t.string :choice
      t.timestamps
    end
  end

  def self.down
    drop_table :skill_bonus_preferences
  end
end
