class UsersController < ApplicationController
#before_action :authenticate_admin!
 def new 
@subscription = Subscription.find(params[:subscription_id])


end

def create
@subscription = Subscription.find(params[:subscription_id])
@user = @subscription.users.create(user_params)

uri = URI("https://api.infobip.com/sms/1/text/single")

Net::HTTP.start(uri.host, uri.port,
:use_ssl => uri.scheme == 'https', 
:verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
request = Net::HTTP::Post.new uri.request_uri
request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.basic_auth 'hillarynnamdi', 'hillarynnamdi'
request.body = "{\"from\":\"NACOSS ISEC\",\"to\":\"#{@user.phone_no}\",\"text\":\"Hi #{@user.first_name},
Your NACOSS E-voting Password is #{@user.password.to_s},follow this link to vote bit.ly/1RT5K9x\"}"

response = http.request request

puts response.read_body

end


@users = pagination

    
  end

 

  def index
  	@subscription = Subscription.find(params[:subscription_id])
  	if params[:search]
  	  @users =@subscription.users.where("first_name LIKE '#{params[:search]}%' or last_name LIKE '#{params[:search]}%' or phone_no LIKE '#{params[:search].to_s}%' or reg_no LIKE '#{params[:search].to_s}%'").paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
    else
   	 @users =pagination 
  	 
end

  end

    def edit
  	@subscription = Subscription.find(params[:subscription_id])
	   @user = @subscription.users.find(params[:id])


  end

    def update
      @subscription = Subscription.find(params[:subscription_id])
 @user = User.find(params[:id])
 if params[:sms]
  @user.update(update_userparams)
  @users = pagination

  if @user
uri = URI("https://api.infobip.com/sms/1/text/single")

Net::HTTP.start(uri.host, uri.port,
:use_ssl => uri.scheme == 'https', 
:verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
request = Net::HTTP::Post.new uri.request_uri
request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.basic_auth 'hillarynnamdi', 'hillarynnamdi'
request.body = "{\"from\":\"NACOSS ISEC\",\"to\":\"#{@user.phone_no}\",\"text\":\"Hi #{@user.first_name},
Your NACOSS E-voting Password is,follow this link to vote bit.ly/1RT5K9x\"}"

response = http.request request

puts response.read_body

@user.update(password:Devise.friendly_token.first(8))

end
  
else
  @user.update(user_params)
  @users = pagination
end
end
    
 
end

  def destroy
@subscription = Subscription.find(params[:subscription_id])
@user = @subscription.users.find(params[:id])
@user.destroy
@users = pagination

  end

    def show
  	@subscription = Subscription.find(params[:subscription_id])
	@user= User.find(params[:id])
  end


def user_params
      params.require(:user).permit(:first_name, :last_name, :gender, :reg_no, :phone_no,:password)
    end

def update_userparams
      params.require(:user).permit(:first_name, :last_name, :gender, :reg_no, :phone_no)
    end


    def pagination
  @subscription = Subscription.find(params[:subscription_id])
  @users ||= @subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

    end

end
