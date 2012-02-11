class CreateArmors < ActiveRecord::Migration
  def self.up
    create_table :armors do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :armors
  end
end
