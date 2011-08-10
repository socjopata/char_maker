# -*- encoding : utf-8 -*-
class EnchanceCharacterForHardcoring < ActiveRecord::Migration
  def self.up
    add_column :characters, :hardcore_trait_picking, :boolean, :default => false
    add_column :characters, :hardcore_social_class_picking, :boolean, :default => false
  end

  def self.down
    remove_column :characters, :hardcore_trait_picking
    remove_column :characters, :hardcore_social_class_picking
  end
end
