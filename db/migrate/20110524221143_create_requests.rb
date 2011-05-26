class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :name
      t.date :start_date
      t.date :decision_date
      t.string :company
      t.text :comment
      t.string :filename
      t.integer :response_time
      t.string :status, :default => "pending"
      t.float :average
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
