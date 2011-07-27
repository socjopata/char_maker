class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.text :initial_dice_roll_set
      t.integer :character_id
      t.integer :strength #Siła „S”
      t.integer :dexterity #Zręczność „ZR”
      t.integer :endurance #Wytrzymałość „WT”
      t.integer :inteligence #Inteligencja „INT”
      t.integer :faith  #Wiara „WI”
      t.integer :polish #Ogłada „O”
      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end


