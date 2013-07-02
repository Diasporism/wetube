WetubeFrontend::Application.routes.draw do
  root to: 'home#show'
  resources :theaters, only: [:show, :create]
  resources :messages, only: [:create]
  resources :videos, only: [:create] do
    member do
      post :play
      post :pause
      post :sync
    end
  end
  post '/name', to: 'messages#name', as: 'name'
end
