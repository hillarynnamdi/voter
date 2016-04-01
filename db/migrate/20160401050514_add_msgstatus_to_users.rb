class AddMsgstatusToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :has_received_token, :boolean,:default=>false
  	add_column :users, :has_received_thanks_msg, :boolean,:default=>false
  end
end
