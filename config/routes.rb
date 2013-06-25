FanVoice::Application.routes.draw do

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end

  devise_for :users, :controllers => { :registrations => "registrations",
             :omniauth_callbacks => "omniauth_callbacks" }
  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'
  put '/admin/users/:user_id/permissions',
     :to => 'admin/permissions#update',
     :as => :update_user_permissions

  root :to => "characters#index"

  resources :source_materials
  resources :characters do
    resources :tweets
  end

  #oauth and twitter
  match 'auth/:twitter/callback', to: "twitter_characters#create"
  match 'auth/:facebook/callback', to: "devise/sessions#index"
  match 'auth/failure', to: redirect('/')

  #resque background task monitor available for only admins needs to be added

   mount Resque::Server, :at => "/resque"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
