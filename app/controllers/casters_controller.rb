class CastersController < ApplicationController
before_action :authenticate_user!

def new

	@subscription=current_user.subscription
	@aspirants=current_user.subscription.aspirants.order('first_name asc')
	@caster = Caster.new
	@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct
	
end


def create

@user=current_user


@subscription = current_user.subscription

@caster = @subscription.casters.create(caster_params)

if @caster.save
	redirect_to new_subscription_caster_path(current_user.subscription.account_name.tr(' ','-'))
     else
      render 'new'
  end

#@user.update(has_voted:true)

end


def caster_params
      params.require(:caster).permit(:president,:vice_president,:financial_secretary,
      	:secretary_general,:firstprov,:secondprov,:pro,:dos,:dosocial,:treasurer,:asg,:welfare,:voter_id
      	)
    end

end
