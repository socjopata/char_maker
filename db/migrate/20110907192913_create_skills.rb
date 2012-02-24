class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :profession_type
      t.string :name
      t.text :way_it_works
      t.text :description
      t.text :limitations
      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
