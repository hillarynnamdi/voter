class CreateCasters < ActiveRecord::Migration
  def change
    create_table :casters do |t|
      t.string :president
      t.string :vice_president
      t.string :secretary_general
      t.string :financial_secretary
      t.string :pro
      t.references :subscription, index: true, foreign_key: true
      t.string :voter_id

      t.timestamps null: false
    end
  end
end
