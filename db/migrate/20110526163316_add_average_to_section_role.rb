class AddAverageToSectionRole < ActiveRecord::Migration
  def self.up
    add_column :section_roles, :average, :float
  end

  def self.down
    remove_column :section_roles, :average
  end
end
