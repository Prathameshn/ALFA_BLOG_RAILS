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
  get 'signup',to:'users#new'
  # post 'users',to:'users#create'
  resources :users,exept:[:new]
  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'
  delete 'logout',to:'sessions#destroy'
end
