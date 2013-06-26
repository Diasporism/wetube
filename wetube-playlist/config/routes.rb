WetubePlaylist::Application.routes.draw do
  resources :videos, only: [:create]
  resources :playlists, only: [:show, :create]
  put '/playlists/:playlist_id/:video_id', to: 'playlists#update', as: 'update_playlist'
end
