WetubeFrontend::Application.routes.draw do
  root to: 'theatres#show'
  resources :theatres
end
