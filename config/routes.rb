Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  get 'about',to:'pages#about'
  #to allow specfic route
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  #to allow all route
  resources :articles

  get "get_request",to:'pages#get_request'
end
