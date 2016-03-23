class AddMoreToAspirants < ActiveRecord::Migration
  def change
    add_column :aspirants, :level, :string
  end
end
