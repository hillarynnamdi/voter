class Subscription < ActiveRecord::Base

before_validation { self.account_name = account_name.upcase }

	validates :account_name, presence: true
	validates :account_name, uniqueness: {case_sentivive:false} ,if: "account_name.present?"
	validates :account_name, length: {minimum:3} ,if: "account_name.present?"
	validates :account_name, length: {maximum:100} ,if: "account_name.present?"



end
