class AddImageToAspirants < ActiveRecord::Migration
  def change
    add_column :aspirants, :image, :string
  end
end
