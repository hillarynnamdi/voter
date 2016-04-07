class AddMsgTokenStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sent_token, :string
  end
end
