Rails.application.routes.draw do
  resources :users do
    resources :lists do
      resources :items
    end
  end

  # Messages
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]

  root 'newsfeed#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
