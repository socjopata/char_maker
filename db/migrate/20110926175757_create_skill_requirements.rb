class CreateSkillRequirements < ActiveRecord::Migration
  def self.up
    create_table :skill_requirements do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_requirements
  end
end
