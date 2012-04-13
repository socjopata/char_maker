class CreateDeities < ActiveRecord::Migration
  def self.up
    create_table :deities do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :deities
  end
end
