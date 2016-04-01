class AspirantsController < ApplicationController
before_action :authenticate_admin!

 def new 
@subscription = Subscription.find(params[:subscription_id])



  end
	  def create
    @subscription = Subscription.find(params[:subscription_id])
    @aspirant = @subscription.aspirants.create(aspirant_params)
    @aspirants=pagination

    
  end

 

  def index
  	@subscription = Subscription.find(params[:subscription_id])
  	if params[:search]
  	  @aspirants =@subscription.aspirants.where("position LIKE '#{params[:search]}%' ").paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
    else
   	@aspirants=pagination
  	 
end

  end

  def edit
  	@subscription = Subscription.find(params[:subscription_id])
	@aspirant = @subscription.aspirants.find(params[:id])


  end

  def show
  	@subscription = Subscription.find(params[:subscription_id])
@aspirant = Aspirant.find(params[:id])
  end

  def destroy
@subscription = Subscription.find(params[:subscription_id])
@aspirant = @subscription.aspirants.find(params[:id])
@aspirant.destroy
@aspirants=pagination

  end

  def update
 @aspirant = Aspirant.find(params[:id])
 @aspirant.update(aspirant_params)
@subscription = Subscription.find(params[:subscription_id])
@aspirants=pagination
    
 
end
 
  private
    def aspirant_params
      params.require(:aspirant).permit(:first_name, :last_name, :gender, :image,:position,:statement,:level)
    end

    def pagination
    @aspirants ||=@subscription.aspirants.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

    end

end
