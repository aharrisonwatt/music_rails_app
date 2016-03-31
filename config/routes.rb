Rails.application.routes.draw do
  resources :tracks, except: :index
  resources :albums, except: :index
  resources :bands
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
