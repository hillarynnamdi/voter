class AddPositionToAspirants < ActiveRecord::Migration
  def change
    add_column :aspirants, :position, :string
  end
end
