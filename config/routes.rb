Rails.application.routes.draw do
  root "categories#index"
  devise_for :users
  resources :users, :only =>[:show]
  resources :recipes
  post 'recipes/:id/favorite', to: 'recipes#toggle_favorite', as: 'favorite_recipe'

  # get 'users/:id', controller: 'users', action:'show'
  # get '/users/:id', to:'users#show'
  # get 'new/ingredient', to: 'recipes#ingredient'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
