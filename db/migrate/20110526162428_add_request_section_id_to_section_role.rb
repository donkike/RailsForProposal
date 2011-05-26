class AddRequestSectionIdToSectionRole < ActiveRecord::Migration
  def self.up
    add_column :section_roles, :request_section_id, :integer
  end

  def self.down
    remove_column :section_roles, :request_section_id
  end
end
