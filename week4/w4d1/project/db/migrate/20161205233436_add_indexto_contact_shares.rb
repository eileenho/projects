class AddIndextoContactShares < ActiveRecord::Migration[5.0]
  def change
    change_table :contact_shares do |t|
      add_index(:contact_shares, [:contact_id, :user_id], :unique => true)
      add_index(:contact_shares, :contact_id)
      add_index(:contact_shares, :user_id)
    end
  end
end
