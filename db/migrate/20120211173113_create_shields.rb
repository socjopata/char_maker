class CreateShields < ActiveRecord::Migration
  def self.up
    create_table :shields do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :shields
  end
end
