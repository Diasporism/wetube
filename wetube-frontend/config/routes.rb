WetubeFrontend::Application.routes.draw do
  root to: 'home#show'
  resources :theaters, only: [:show, :create]
  resources :messages, only: [:create]
end
