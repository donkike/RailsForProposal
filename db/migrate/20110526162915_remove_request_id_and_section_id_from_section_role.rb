class RemoveRequestIdAndSectionIdFromSectionRole < ActiveRecord::Migration
  def self.up
    remove_column :section_roles, :request_id
    remove_column :section_roles, :section_id
  end

  def self.down
    add_column :section_roles, :section_id, :integer
    add_column :section_roles, :request_id, :integer
  end
end
