Rails.application.routes.draw do
  resources :messages, only: [:create]
  # resources :chats, only: [:Index]
  # scope :chats do
  #   get '/' => 'chats#index'
  # end
  root 'chats#index'

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index]
    end
  end
end
