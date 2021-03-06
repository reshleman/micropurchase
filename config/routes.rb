Rails.application.routes.draw do
  root 'auctions#index'

  resources :auctions, only: [:index, :show] do
    resources :bids, only: [:new, :create, :index]
  end

  resources :bids, only: [:index]

  get '/my-bids', to: 'bids#my_bids'

  resources :users, only: [:edit, :update]

  namespace :admin do
    resources :auctions
    resources :users
  end

  get '/auth/:provider/callback', to: 'authentications#create'
  get '/login', to: 'logins#index'
  get '/logout', to: 'authentications#destroy'
end
