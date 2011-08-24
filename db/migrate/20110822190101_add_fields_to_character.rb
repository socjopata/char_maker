# -*- encoding : utf-8 -*-
class AddFieldsToCharacter < ActiveRecord::Migration
    def self.up
    add_column :characters, :lead_parameter, :string
  end

  def self.down
     remove_column :characters, :lead_parameter
  end
end
