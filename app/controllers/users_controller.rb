class UsersController < ApplicationController

 def new 
@subscription = Subscription.find(params[:subscription_id])



  end
	  def create
    @subscription = Subscription.find(params[:subscription_id])
    @user = @subscription.users.create(user_params)
	@users =@subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')


    
  end

 

  def index


  	@subscription = Subscription.find(params[:subscription_id])
  	if params[:search]
  	  @users =@subscription.users.where("first_name LIKE '#{params[:search]}%' or last_name LIKE '%#{params[:search]}%' or phone_no LIKE '%#{params[:search]}%' or reg_no LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
    else
   	 @users =@subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  	 
end

  end

    def edit
  	@subscription = Subscription.find(params[:subscription_id])
	@user = @subscription.users.find(params[:id])


  end

    def update
 @user = User.find(params[:id])
 @user.update(user_params)
@subscription = Subscription.find(params[:subscription_id])
  @users =@subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
 
end

  def destroy
@subscription = Subscription.find(params[:subscription_id])
@user = @subscription.users.find(params[:id])
@user.destroy
@users =@subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

  end

    def show
  	@subscription = Subscription.find(params[:subscription_id])
	@user= User.find(params[:id])
  end


def user_params
      params.require(:user).permit(:first_name, :last_name, :gender, :reg_no,:phone_no,:password)
    end

end
