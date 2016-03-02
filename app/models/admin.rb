class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable

         has_one_time_password(encrypted: true)

         
  def send_two_factor_authentication_code
    puts ">>>>>>>>>>>>>>> otp_secret_key: #{otp_secret_key}, otp_code: #{otp_code}"
  end

  def need_two_factor_authentication?(request)
    not otp_secret_key.nil?
  end
end
