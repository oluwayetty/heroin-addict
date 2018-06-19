Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :daily_moods, only: :create
  resources :journals, only: [:new, :create, :index, :show, :edit, :update]
  resources :letters, only: [:index, :create,:show, :new]

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages
end
