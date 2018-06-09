Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :daily_moods, only: :create
  resources :journals, only: [:new, :create, :index, :show]
  resources :letters, only: [:index, :create,:show, :new]
end
