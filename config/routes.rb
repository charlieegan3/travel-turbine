TravelPlanner::Application.routes.draw do
  root to: "static#index"
  get '/journeys', to: 'users#journeys'
  get 'about', to: 'static#about'

  devise_for :admins, :controllers => { :registrations => "admins/registrations" } #swap out devise registrations controller for my one.
  devise_for :users
  resources :journeys

  get '/journey/new', to: 'journeys#new'    # For some reason "resources :journeys"  isn't activating the new method.
  get '/search', to: 'static#search'

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "/users/sign_out", :to => "devise/sessions#destroy"
    get "sign_up", :to => "devise/registrations#new"
  end

  devise_scope :admin do
    get 'sign_in', :to => 'devise/sessions#new'
    get '/admins/sign_out', :to => 'devise/sessions#destroy'
    get '/admins/add_admin', :to => 'admins#add_admin'
    post '/admins/add', :to => "admins#save_admin"
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
