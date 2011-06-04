class AddAggregateToRequestSection < ActiveRecord::Migration
  def self.up
    add_column :request_sections, :aggregate, :float
  end

  def self.down
    remove_column :request_sections, :aggregate
  end
end
