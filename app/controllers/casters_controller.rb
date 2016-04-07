class CastersController < ApplicationController
before_action :authenticate_user!

def new


	@subscription=current_user.subscription
	@aspirants=current_user.subscription.aspirants.order('first_name asc')
	@caster = @subscription.casters.new
	@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct
	
end


def create

@user=current_user
@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct
@aspirants=current_user.subscription.aspirants.order('first_name asc')

@subscription = current_user.subscription

@caster = @subscription.casters.create(caster_params)

if @caster.save
	require 'json'
	@user.update(has_voted:true)
uri = URI("https://api.infobip.com/sms/1/text/single")

Net::HTTP.start(uri.host, uri.port,
:use_ssl => uri.scheme == 'https', 
:verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
request = Net::HTTP::Post.new uri.request_uri
request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.basic_auth 'chrisgeek', 'ifeanyi29'
request.body = "{\"from\":\"NACOSS ISEC\",\"to\":\"#{current_user.phone_no}\",\"text\":\"Hi #{current_user.first_name},Thanks for voting! Your vote has been saved.\"}"

response = http.request request

puts response.read_body
data = JSON.parse(response.body)
@user.update(sent_thanks:data['messages'][0]['status']['groupName'])

end

flash[:saved_vote]= "VOTED SUCCESSFULLY"
redirect_to new_subscription_caster_path  
      
  else
  	render 'new'
end

end


def caster_params
      params.require(:caster).permit(:president,:vice_president,:financial_secretary,
      	:secretary_general,:firstprov,:secondprov,:pro,:dos,:dosocial,:treasurer,:asg,:welfare,:voter_id
      	)
    end

end
