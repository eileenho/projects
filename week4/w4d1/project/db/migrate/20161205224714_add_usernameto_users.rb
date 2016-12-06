class AddUsernametoUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :email
      t.rename :name, :username, null: false
    end
  end
end
