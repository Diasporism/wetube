WetubeChat::Application.routes.draw do
  resources :conversations, only: [:show, :create] do
    resources :messages, only: [:create]
  end
end
