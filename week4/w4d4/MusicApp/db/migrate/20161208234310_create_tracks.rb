class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :track_name, null: false
      t.string :bonus_or_regular
      t.string :lyrics

      t.timestamps
    end
  end
end
