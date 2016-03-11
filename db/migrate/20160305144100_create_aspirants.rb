class CreateAspirants < ActiveRecord::Migration
  def change
    create_table :aspirants do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :political_ambition
      t.references :subscription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
