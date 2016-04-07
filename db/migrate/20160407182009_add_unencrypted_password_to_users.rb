class AddUnencryptedPasswordToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :unencrypted_password, :string
  end
end
