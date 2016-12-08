class AddStudioColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :studio_or_live, :string
  end
end
