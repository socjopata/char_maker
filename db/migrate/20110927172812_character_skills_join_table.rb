# -*- encoding : utf-8 -*-
class CharacterSkillsJoinTable < ActiveRecord::Migration
  def self.up
     create_table :character_skills do |t|
      t.integer :character_id
      t.integer :skill_id
    end
  end

  def self.down
    drop_table :character_skills
  end
end
