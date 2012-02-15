class CreateRangedWeapons < ActiveRecord::Migration
  def self.up
    create_table :ranged_weapons do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :ranged_weapons
  end
end
