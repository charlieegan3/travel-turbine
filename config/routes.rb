TravelPlanner::Application.routes.draw do
  
  devise_for :admins
  devise_for :users
  resources :journeys

  root to: "static#index"

  get '/journey/new', to: 'journeys#new'    # For some reason "resources :journeys"  isn't activating the new method.
  get '/search', to: 'static#search'

  get '/admins/add_admin', to: 'admins#add_admin'

  devise_scope :user do
    get 'users/sign_out', to: 'session#destroy'
    # Don't need to define sign_in here, because it works already (unlike admin).
  end

  devise_scope :admin do 
    get 'admins/sign_out', to: 'devise/sessions#destroy'
    get 'admins/sign_in', to: 'devise/sessions#new'
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
