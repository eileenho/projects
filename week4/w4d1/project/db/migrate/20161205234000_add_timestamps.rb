class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    add_column :contacts, :created_at, :datetime
    add_column :contacts, :updated_at, :datetime
  end
end
