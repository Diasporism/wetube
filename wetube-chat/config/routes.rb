WetubeChat::Application.routes.draw do
  resources :conversations, only: [:show]


end
