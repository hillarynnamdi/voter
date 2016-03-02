class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :account_name

      t.timestamps null: false
    end
  end
end
