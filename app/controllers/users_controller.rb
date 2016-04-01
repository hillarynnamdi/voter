class UsersController < ApplicationController
before_action :authenticate_admin!
 def new 
@subscription = Subscription.find(params[:subscription_id])

@generated_password = Devise.friendly_token.first(8)

end

def create
@subscription = Subscription.find(params[:subscription_id])
@user = @subscription.users.create(user_params)


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
 @user.update(user_params)
  @users = pagination
    
 
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
      params.require(:user).permit(:first_name, :last_name, :gender, :reg_no, :phone_no)
    end


    def pagination
  @subscription = Subscription.find(params[:subscription_id])
  @users ||= @subscription.users.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

    end

end
