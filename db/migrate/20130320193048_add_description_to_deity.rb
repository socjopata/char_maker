class AddDescriptionToDeity < ActiveRecord::Migration
  def change
    add_column :deities, :description, :text
  end
end
