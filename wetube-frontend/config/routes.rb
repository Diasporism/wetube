WetubeFrontend::Application.routes.draw do
  root to: 'home#show'
  resources :theater, only: [:show, :create]
end
