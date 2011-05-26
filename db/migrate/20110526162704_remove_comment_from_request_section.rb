class RemoveCommentFromRequestSection < ActiveRecord::Migration
  def self.up
    remove_column :request_sections, :comment
  end

  def self.down
    add_column :request_sections, :comment, :text
  end
end
