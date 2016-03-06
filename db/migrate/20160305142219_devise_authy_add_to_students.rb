class DeviseAuthyAddToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.string    :authy_id
      t.datetime  :last_sign_in_with_authy
      t.boolean   :authy_enabled, :default => true
    end

    add_index :students, :authy_id
  end

  def self.down
    change_table :students do |t|
      t.remove :authy_id, :last_sign_in_with_authy, :authy_enabled
    end
  end
end

