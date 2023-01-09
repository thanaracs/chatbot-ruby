Rails.application.routes.draw do
  resources :messages, only: [:create]

  root "chats#index"
end
