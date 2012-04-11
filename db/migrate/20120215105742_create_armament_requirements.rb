# -*- encoding : utf-8 -*-
class CreateArmamentRequirements < ActiveRecord::Migration
  def self.up
    create_table :armament_requirements do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :check_applies_to
      t.string :name
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :armament_requirements
  end
end
