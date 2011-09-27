class CharacterSkillsJoinTable < ActiveRecord::Migration
  def self.up
     create_table :characters_skills, :id => false do |t|
      t.integer :character_id
      t.integer :skill_id
    end
  end

  def self.down
    drop_table :characters_skills
  end
end
