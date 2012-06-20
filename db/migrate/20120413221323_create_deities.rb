# -*- encoding : utf-8 -*-
class CreateDeities < ActiveRecord::Migration
  def self.up
    create_table :deities do |t|
      t.string :name
      t.timestamps
    end

    create_table :countries_deities, :id => false do |t|
       t.integer :deity_id
       t.integer :country_id
    end

  end

  def self.down
    drop_table :deities
    drop_table :countries_deities
  end
end
