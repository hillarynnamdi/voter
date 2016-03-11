class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :reg_no
      t.string :phone_no
      t.references :subscription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
