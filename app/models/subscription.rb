class Subscription < ActiveRecord::Base

has_many :aspirants
has_many :users


before_validation { self.account_name = account_name.upcase }

	validates :account_name, presence: true
	validates :account_name, uniqueness: {case_sensitivity:false} ,if: "account_name.present?"
	validates :account_name, length: {minimum:3} ,if: "account_name.present?"
	validates :account_name, length: {maximum:100} ,if: "account_name.present?"



end
