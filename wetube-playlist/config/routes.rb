WetubePlaylist::Application.routes.draw do
  resources :videos, only: [:create]  
end
