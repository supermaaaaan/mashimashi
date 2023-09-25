Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :noris do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'noris#index'

end
