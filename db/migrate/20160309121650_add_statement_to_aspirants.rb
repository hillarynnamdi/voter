class AddStatementToAspirants < ActiveRecord::Migration
  def change
    add_column :aspirants, :statement, :string
  end
end
