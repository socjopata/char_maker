# -*- encoding : utf-8 -*-
class AddSessionToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :session, :text, :default => {}
  end

  def self.down
    remove_column :characters, :session
  end
end
