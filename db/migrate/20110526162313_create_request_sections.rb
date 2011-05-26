class CreateRequestSections < ActiveRecord::Migration
  def self.up
    create_table :request_sections do |t|
      t.integer :section_id
      t.integer :request_id
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :request_sections
  end
end
