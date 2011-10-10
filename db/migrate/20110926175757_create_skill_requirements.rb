class CreateSkillRequirements < ActiveRecord::Migration
  def self.up
    create_table :skill_requirements do |t|
      t.string :check_applies_to
      t.string :name
      t.string :value
      t.integer :skill_id
      t.timestamps
    end
  end

  def self.down
    drop_table :skill_requirements
  end
end

#types:
#
#skill
#statistics
#socialclass
#
