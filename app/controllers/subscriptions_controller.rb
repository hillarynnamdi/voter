class SubscriptionsController < ApplicationController


  before_action :set_subscription, only: [:show, :edit, :update, :destroy, :delete]
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
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

        @subscriptions = Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
      
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
  
     @subscriptions = Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
      @subscription = Subscription.find(params[:id])

      @subscription.update(subscription_params)

      respond_to do |format|
format.js{}

      end

  end

  # DELETE /subscriptions/1

  # DELETE /subscriptions/1.json
  def destroy
    @subscriptions = Subscription.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    @subscription = Subscription.find(params[:id])
   @subscription.destroy

   respond_to do|format|

format.js{}
 end
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
end
