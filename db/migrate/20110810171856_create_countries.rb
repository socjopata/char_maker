# -*- encoding : utf-8 -*-
class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.text :description
      t.string :c_type
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
