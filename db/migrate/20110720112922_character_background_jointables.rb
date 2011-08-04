# -*- encoding : utf-8 -*-
class CharacterBackgroundJointables < ActiveRecord::Migration
  def self.up
    create_table :character_backgrounds_traits, :id => false do |t|
     t.integer :character_background_id
     t.integer :trait_id
    end
     create_table :character_backgrounds_social_classes, :id => false do |t|
     t.integer :character_background_id
     t.integer :social_class_id
    end

  end

  def self.down
    drop_table :character_backgrounds_traits
    drop_table :character_backgrounds_social_classes
  end
end
