class User < ActiveRecord::Base
  belongs_to :subscription

before_validation { self.first_name = first_name.camelcase }
before_validation { self.last_name = last_name.camelcase }


    	validates :first_name, presence: true
	validates :first_name, length: {minimum:3} ,if: "first_name.present?"
	validates :first_name, length: {maximum:100} ,if: "first_name.present?"

	validates :last_name, presence: true
	validates :last_name, length: {minimum:3} ,if: "last_name.present?"
	validates :last_name, length: {maximum:100} ,if: "last_name.present?"

	validates :reg_no, presence: true
	validates :reg_no, length: {minimum:10} ,if: "reg_no.present?"
	validates :reg_no, length: {maximum:11} ,if: "reg_no.present?"
	validates :reg_no, uniqueness: {case_sensitivity:false} ,if: "reg_no.present?"

	validates :phone_no, presence: true
	validates :phone_no, length: {minimum:11} ,if: "phone_no.present?"
	validates :phone_no, length: {maximum:15} ,if: "phone_no.present?"
	validates :phone_no, uniqueness: {case_sensitivity:false} ,if: "phone_no.present?"

	validates :password, presence: true
	validates :password, length: {minimum:7} ,if: "password.present?"
	validates :password, length: {maximum:7} ,if: "password.present?"
	validates :password, uniqueness: {case_sensitivity:false} ,if: "phone_no.present?"

	validates :gender, presence: true
end