Rails.application.routes.draw do
  
  resources :users

  root 'home#index'
  
  #routes for home
  get 'login' => "home#login"
  #get 'signup' => "home#signup"
  get 'about' => "home#about"
  get 'contact' => "home#contact"
  get 'help' => "home#help"
  
  #routes for tutorials
  get 'tutorials' => 'tutorials#index'
  post 'tutorials' => 'tutorials#create'
  get 'tutorials/new' => 'tutorials#new', as: :new_tutorial
  delete 'tutorials/:id' => 'tutorials#destroy' , as: :delete_tutorial
  get 'tutorials/:id/edit' => 'tutorials#edit', as: :edit_tutorial  
  post 'tutorials/:id' => 'tutorials#update', as: :update_tutorial
  
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
