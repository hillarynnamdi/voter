class AddMoreToCasters < ActiveRecord::Migration
  def change
    add_column :casters, :dos, :string
    add_column :casters, :welfare, :string
    add_column :casters, :asg, :string
    add_column :casters, :firstprov, :string
    add_column :casters, :secondprov, :string
    add_column :casters, :treasurer, :string
  end
end
