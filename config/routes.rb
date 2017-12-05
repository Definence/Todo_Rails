Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :tasks
  root 'tasks#index'
  #root to "home#index"

  resources :tasks do
    put :complete, on: :member
  end

  resources :tasks do
    put :uncomplete, on: :member
  end
end
