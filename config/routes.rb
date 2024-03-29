AwesomeApp::Application.routes.draw do
  resources :reports

  resources :fuel_loads
  
  get "sessions/new"

  get "users/new"
  
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tractors
  resources :operations
  resources :tractor_drivers
  resources :lands
  resources :get_reports
  
  match "new_salary", :to => "get_reports#new_salary"
  
  match "/load_for_tractor", :to => "fuel_loads#show_for_tractor"
  match "/load_for_driver", :to => "fuel_loads#show_for_driver"
  
  match "/add_machine", :to => 'tractors#add_machine'
  match "/add_tractor_driver", :to => 'tractor_drivers#add_tractor_driver'
  match "/add_land", :to => 'lands#add_land'
  match "/add_operation", :to => 'operations#add_operation'
  
  match "/contact", :to => 'pages#contact'
  match "/help", :to => 'pages#help'
  match '/about', :to => "pages#about"
  match '/home', :to => 'pages#home'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/edit', :to => 'users#edit'
  
  root :to => 'pages#home'
  
  get "pages/home"
  get "pages/contact"  
  get "pages/about"
  get "pages/help"
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
  # match ':controller(/:action(/:id(.:format)))'
end
