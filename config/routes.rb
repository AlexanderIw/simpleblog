Rails.application.routes.draw do
  get 'staff/index'

  get 'staff/menu'

  get 'staff/login'

  get 'staff/logout'

  #get 'public_pages/index'
  #get 'public_pages/blog'
  #get 'public_pages/projects'
  #get 'public_pages/resume'
  #get 'public_pages/contact'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"
  # You can have the root of your site routed with "root"
  root :to => 'public_pages#index'
  match '/blog',    to: 'public_pages#blog', :via => :get
  match '/projects', to: 'public_pages#projects', :via => :get
  match '/resume',   to: 'public_pages#resume', :via => :get
  match '/leisure',   to: 'public_pages#leisure', :via => :get
  match '/contact',  to: 'public_pages#contact', :via => :get
  match '/jap',      to: 'public_pages#jap', :via => :get
  match '/readinglist',    to: 'public_pages#books', :via => :get
  match '/test', to: 'public_pages#test', :via => :get 
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
