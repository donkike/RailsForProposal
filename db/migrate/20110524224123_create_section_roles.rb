class CreateSectionRoles < ActiveRecord::Migration
  def self.up
    create_table :section_roles do |t|
      t.integer :section_id
      t.integer :user_id
      t.integer :request_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :section_roles
  end
end
