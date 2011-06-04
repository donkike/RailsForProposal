class AddAggregateToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :aggregate, :float
  end

  def self.down
    remove_column :requests, :aggregate
  end
end
