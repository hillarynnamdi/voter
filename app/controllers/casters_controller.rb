class CastersController < ApplicationController
before_action :authenticate_user!
def new

	@subscription=current_user.subscription
	@aspirants=current_user.subscription.aspirants.order('first_name asc')
	@caster = Caster.new
	@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct

	
end


def create

@aspirants=current_user.subscription.aspirants.order('first_name asc')
@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct

@user=current_user

@subscription = current_user.subscription

@caster = @subscription.casters.create(caster_params)

if @caster.save
	@presidentcount=current_user.subscription.casters.where("president='#{@caster.president}' ").count
	@first_name=@caster.president.split(' ')[0]
	@last_name=@caster.president.split(' ')[1]
	@presidentupdate=Aspirant.find_by(first_name:@first_name,last_name:@last_name)
	@presidentupdate.update(number_of_votes:@presidentcount)
	#@user.update(has_voted:true)
	redirect_to subscription_results_path(current_user.subscription.account_name.tr(' ','-'))
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
