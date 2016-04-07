class AddMsgThanksStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sent_thanks, :string
  end
end
