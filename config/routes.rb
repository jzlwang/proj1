Rails.application.routes.draw do
  patch '/pokemons/capture', to: 'pokemon#capture', as: 'capture'
  patch '/pokemons/damage', to: 'pokemon#damage', as: 'damage'
  get 'pokemons/new', to:'pokemon#new', as: 'new'
  post '/pokemons/create', to: 'pokemon#create', as: 'create'

  root to: 'home#index'
  devise_for :trainers
  resources :trainers
end
