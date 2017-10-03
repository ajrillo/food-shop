Rails.application.routes.draw do
  resources :promotions
  resources :deliveries
  resources :orders
  #resources :users

  get 'home/index'
  post 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/privacy'
  get 'home/help'
  get 'home/user'

  get 'home/login'
  get 'home/logout'
  post 'home/login'

  get 'home/search'
  post 'home/search'

  get 'reports/listing'
  get 'reports/customers'
  get 'reports/products'
  get 'reports/sales'

  # Sets landing page
  root :to => 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
