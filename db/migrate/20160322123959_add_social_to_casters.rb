class AddSocialToCasters < ActiveRecord::Migration
  def change
    add_column :casters, :dosocial, :string
  end
end
