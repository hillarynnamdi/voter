class AddTimerToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :timer, :string
  end
end
