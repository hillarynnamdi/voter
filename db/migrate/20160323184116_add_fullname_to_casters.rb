class AddFullnameToCasters < ActiveRecord::Migration
  def change
  	add_column :casters, :dos_name, :string
    add_column :casters, :welfare_name, :string
    add_column :casters, :asg_name, :string
    add_column :casters, :firstprov_name, :string
    add_column :casters, :secondprov_name, :string
    add_column :casters, :treasurer_name, :string
    add_column :casters, :dosocial_name, :string
    add_column :casters, :president_name, :string
    add_column :casters, :vice_president_name, :string
    add_column :casters, :financial_secretary_name, :string
    add_column :casters, :pro_name, :string
    add_column :casters, :secretary_general_name, :string
  end
end
