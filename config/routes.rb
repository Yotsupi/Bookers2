Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :users, only: [:show, :edit, :create, :index, :update]
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]
end
