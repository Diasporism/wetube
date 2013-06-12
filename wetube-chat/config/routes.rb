WetubeChat::Application.routes.draw do
  resources :conversations, only: [:show] do
    resources :messages, only: [:create]
  end
end
