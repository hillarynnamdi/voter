class SubscriptionsController < ApplicationController
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

        send_sms('+2349054047819', 'hello from smsapi')
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

def aspirants
@subscription = Subscription.find(params[:subscription_id])
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:account_name)
    end

  def pagination
    @subscriptions ||= Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end
end
