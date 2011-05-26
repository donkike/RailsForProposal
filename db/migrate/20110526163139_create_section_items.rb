class CreateSectionItems < ActiveRecord::Migration
  def self.up
    create_table :section_items do |t|
      t.integer :request_section_id
      t.string :name
      t.integer :value
      t.timestamps
    end
  end

  def self.down
    drop_table :section_items
  end
end
