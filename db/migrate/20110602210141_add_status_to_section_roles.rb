class AddStatusToSectionRoles < ActiveRecord::Migration
  def self.up
    add_column :section_roles, :status, :string, :default => "pending"
  end

  def self.down
    remove_column :section_roles, :status
  end
end
