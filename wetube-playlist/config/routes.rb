WetubePlaylist::Application.routes.draw do
  resources :videos, only: [:create]
  resources :playlists, only: [:show, :create]
end
