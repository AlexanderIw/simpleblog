Rails.application.routes.draw do

  resources :users, :posts, :hashtags
  
  get 'admin/index'
  get 'admin/menu'
  get 'admin/login'
  get 'admin/logout'
  get 'sessions/new'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destory'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"
  root                     to: 'public_pages#index'
  match '/blog',           to: 'public_pages#blog', :via => :get
  match '/projects',       to: 'public_pages#projects', :via => :get
  match '/resume',         to: 'public_pages#resume', :via => :get
  match '/leisure',        to: 'public_pages#leisure', :via => :get
  match '/contact',        to: 'public_pages#contact', :via => :get
  match '/jap',            to: 'public_pages#jap', :via => :get
  match '/readinglist',    to: 'public_pages#books', :via => :get

  match '/menu',           to: 'admin#menu', via: :get
end