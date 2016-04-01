class ResultsController < ApplicationController
before_action :authenticate_user!
	def show

	@aspirants=current_user.subscription.aspirants.order('first_name asc')
	@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct

	@president=current_user.subscription.casters.where("president not like ''")
	@vice_president=current_user.subscription.casters.where("vice_president not like ''")
	@financial_secretary=current_user.subscription.casters.where("financial_secretary not like ''")
	@secretary_general=current_user.subscription.casters.where("secretary_general not like ''")
	@firstprov=current_user.subscription.casters.where("firstprov not like ''")
	@secondprov=current_user.subscription.casters.where("secondprov not like ''")
	@pro=current_user.subscription.casters.where("pro not like ''")
	@dos=current_user.subscription.casters.where("dos not like ''")
	@dosocial=current_user.subscription.casters.where("dosocial not like ''")
	@treasurer=current_user.subscription.casters.where("treasurer not like ''")
	@asg=current_user.subscription.casters.where("asg not like ''")
	@welfare=current_user.subscription.casters.where("welfare not like ''")

	end


	def index

	@aspirants=current_user.subscription.aspirants.order('first_name asc')
	@position=current_user.subscription.aspirants.select(:position).order('position asc').distinct

	@president=current_user.subscription.casters.where("president not like ''")
	@vice_president=current_user.subscription.casters.where("vice_president not like ''")
	@financial_secretary=current_user.subscription.casters.where("financial_secretary not like ''")
	@secretary_general=current_user.subscription.casters.where("secretary_general not like ''")
	@firstprov=current_user.subscription.casters.where("firstprov not like ''")
	@secondprov=current_user.subscription.casters.where("secondprov not like ''")
	@pro=current_user.subscription.casters.where("pro not like ''")
	@dos=current_user.subscription.casters.where("dos not like ''")
	@dosocial=current_user.subscription.casters.where("dosocial not like ''")
	@treasurer=current_user.subscription.casters.where("treasurer not like ''")
	@asg=current_user.subscription.casters.where("asg not like ''")
	@welfare=current_user.subscription.casters.where("welfare not like ''")

	end



end
