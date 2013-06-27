WetubePlaylist::Application.routes.draw do
  resources :videos, only: [:create]
  resources :playlists, only: [:show, :create]
  put '/playlists/:playlist_id/videos/:video_id', to: 'playlists#update', as: 'update_playlist'
  get '/playlists/:playlist_id/playlist_videos', to: 'playlists#playlist_videos', as: 'playlist_videos'
end
