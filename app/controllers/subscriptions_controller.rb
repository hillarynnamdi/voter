class SubscriptionsController < ApplicationController
  #before_action :authenticate_admin!

  before_action :set_subscription, only: [:show, :edit, :update, :destroy, :delete]
  # GET /subscriptions
  # GET /subscriptions.json

  def index
    
    if params[:search]
      @subscriptions =Subscription.where("account_name LIKE '#{params[:search]}%' ").paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
    else
    @subscriptions=pagination
     
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.save

        @subscriptions=pagination

  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
  
     
      @subscription = Subscription.find(params[:id])

      @subscription.update(subscription_params)
      @subscriptions = pagination
      

  end

  # DELETE /subscriptions/1

  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
   @subscription.destroy
   @subscriptions=pagination

  end

  def add
@subscription = Subscription.find(params[:subscription_id])
  end

   def timer
@subscription = Subscription.find(params[:subscription_id])
  end

def aspirants
@subscription = Subscription.find(params[:subscription_id])
end


def sms
@subscription = Subscription.find(params[:subscription_id])
    if params[:search]
      @users =@subscription.users.where("first_name LIKE '#{params[:search]}%' or last_name LIKE '#{params[:search]}%' or phone_no LIKE '#{params[:search].to_s}%' or reg_no LIKE '#{params[:search].to_s}%'").paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
      
    else
     @users ||= @subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

   end

   @usersmetrics = @subscription.users
   @userstoken=@subscription.users.where("has_received_token='true'")
   @usersthanks=@subscription.users.where("has_received_thanks_msg='true'")


end


def send_smstoken
@subscription = Subscription.find(params[:subscription_id])
        

 @subscription.users.each do |user|

uri = URI("https://api.infobip.com/sms/1/text/single")
Net::HTTP.start(uri.host, uri.port,
:use_ssl => uri.scheme == 'https', 
:verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
request = Net::HTTP::Post.new uri.request_uri
request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.basic_auth 'hillarynnamdi', 'hillarynnamdi'
@newpassword=Devise.friendly_token.first(8)
request.body = "{\"from\":\"NACOSS ISEC\",\"to\":\"#{user.phone_no}\",\"text\":\"Hi #{user.first_name},Your NACOSS E-voting Password is #{@newpassword}\"}"

response = http.request request

puts response.read_body
end

    #message.update_attribute('sender_status', 1) if message.sender_id == current_user.id
    #message.update_attribute('recipient_status', 1) if message.recipient_id == current_user.id
    #message.destroy if message.sender_status == 1 && message.recipient_status == 1
  end


end

def send_smsthanks
@subscription = Subscription.find(params[:subscription_id])

  @users = @subscription.users.all
    @users.each do |user|
      
uri = URI("https://api.infobip.com/sms/1/text/single")

Net::HTTP.start(uri.host, uri.port,
:use_ssl => uri.scheme == 'https', 
:verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

request = Net::HTTP::Post.new uri.request_uri
request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.basic_auth 'hillarynnamdi', 'hillarynnamdi'
request.body = "{\"from\":\"NACOSS ISEC\",\"to\":\"#{user.phone_no}\",\"text\":\"Hi #{user.first_name},Your NACOSS E-voting Password is #{@user.password.to_s}\"}"

response = http.request request

puts response.read_body

end


    end




end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:account_name,:timer)
    end

  def pagination
    @subscriptions ||= Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end



end
