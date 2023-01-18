Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "application#index"
  resources :user
  resources :book
  resources :login
  resources :logout
  # delete 'logout', to: 'login#destroy'

end
