class AddAverageToRequestSections < ActiveRecord::Migration
  def self.up
    add_column :request_sections, :average, :float, :default => 0.0
  end

  def self.down
    remove_column :request_sections, :average
  end
end
