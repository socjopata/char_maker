class CreatePurses < ActiveRecord::Migration
  def self.up
    create_table :purses do |t|
      t.integer :character_id
      t.integer :cooper    # 10c = 1s; 10s = 1g; 10g = 1p
      t.timestamps
    end
  end

  def self.down
    drop_table :purses
  end
end
