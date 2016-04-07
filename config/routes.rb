Rails.application.routes.draw do


#devise_for :users

#devise_scope :user do
  #get "sign_in", to: "devise/sessions#new"
 # get "login" => "devise/sessions#new"
  #delete "/sign_out" => "devise/sessions#destroy"
  #get "" => "devise/sessions#new"
  #delete "/logout" => "devise/sessions#destroy"
  #delete "users/sign_out" => "devise/sessions#destroy"
  #root to: "devise/sessions#new"
#end

  get "/subscriptions/:subscription_id/casters"=>"casters#new"

  devise_scope :admin do
      get "admins/sign_out" => "devise/sessions#destroy"
    end

    devise_for :admins

    resources :subscriptions do
    resources :aspirants
    resources :users
    resources :casters
    resources :results
      get "add"
      get "sms"
      get "results_admin"
      post "send_smstoken"
      post "send_smsthanks"
  end

  #devise_for :admins

  #devise_scope :admin do
   #   get "admins/sign_out" => "devise/sessions#destroy"
    #end

  # root 'devise/session#new'
  devise_for :users, path: '/'

  devise_scope :user do
    get "/sign_out" => "devise/sessions#destroy"
      root to: "devise/sessions#new"
  end

 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
