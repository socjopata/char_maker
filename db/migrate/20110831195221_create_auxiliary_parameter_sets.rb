# -*- encoding : utf-8 -*-
class CreateAuxiliaryParameterSets < ActiveRecord::Migration
  def self.up
    create_table :auxiliary_parameter_sets do |t|
      t.integer :character_id
      t.integer :initiative  #inicjatywa
      t.integer :perception #spostrzegawczość
      t.integer :pain_resistance #odp. na ból
      t.integer :fear_resistance #odp na strach
      t.integer :running #bieg
      t.integer :hit_points #punkty życia
      t.timestamps
    end
  end

  def self.down
    drop_table :auxiliary_parameter_sets
  end
end
