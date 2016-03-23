class AddNumberOfVotesToAspirants < ActiveRecord::Migration
  def change
    add_column :aspirants, :number_of_votes, :integer
  end
end
