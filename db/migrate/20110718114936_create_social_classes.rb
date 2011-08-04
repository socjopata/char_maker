# -*- encoding : utf-8 -*-
class CreateSocialClasses < ActiveRecord::Migration
  def self.up
    create_table :social_classes do |t|
      t.text :description
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :social_classes
  end
end
