class CreateAuxiliaryParameterSets < ActiveRecord::Migration
  def self.up
    create_table :auxiliary_parameter_sets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :auxiliary_parameter_sets
  end
end
