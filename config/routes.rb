Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'home#index'

  resources :daily_moods, only: :create
  resources :journals, only: [:new, :create, :index, :show, :edit, :update]
  get '/visible_journals', to: 'journals#visible_journals'
  resource :calendar
  resources :letters, only: [:index, :create,:show, :new]
  post '/letters/:id', to: 'letters#destroy'

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages
  get '/admin', to: 'admin#index'
  resources :users, only: [:index, :update]

end
