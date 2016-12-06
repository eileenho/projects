class AddIndextoContacts < ActiveRecord::Migration[5.0]
  def change
    change_table :contacts do |t|
      add_index(:contacts, [:email, :user_id], :unique => true)
      add_index(:contacts, :user_id)
    end
  end
end
