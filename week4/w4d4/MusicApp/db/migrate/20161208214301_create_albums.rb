class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_name_id
      t.string :album_name

      t.timestamps
    end
  end
end
