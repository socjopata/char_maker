# -*- encoding : utf-8 -*-
class AddTypeToStatistics < ActiveRecord::Migration
  def self.up
      add_column :statistics, :type, :string
  end

  def self.down
      remove_column :statistics, :type
  end
end
