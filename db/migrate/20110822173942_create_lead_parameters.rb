# -*- encoding : utf-8 -*-
class CreateLeadParameters < ActiveRecord::Migration
  def self.up
    create_table :lead_parameters do |t|
      t.integer :profession_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :lead_parameters
  end
end
