# -*- encoding : utf-8 -*-
class AddAvatarToUser < ActiveRecord::Migration
  def self.up
    add_column :characters, :avatar, :string
  end

  def self.down
     remove_column :characters, :avatar
  end
end
