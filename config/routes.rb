Rails.application.routes.draw do
  resources :categories
  resources :recipes
  devise_for :users
  resources :users, :only =>[:show]

  # get 'users/:id', controller: 'users', action:'show'
  # get '/users/:id', to:'users#show'


  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
