class ChangeColumnInAlbums < ActiveRecord::Migration[5.0]
  def change
    rename_column :albums, :band_name_id, :band_id
  end

end
