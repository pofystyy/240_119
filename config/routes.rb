Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :careers,    only: [:index, :show]
  resources :educations, only: [:index, :show]
  resources :works,      only: [:index, :show]
  resources :uploads,    only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :projects,   only: [:index, :show]

  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  get '/log_out', to: 'sessions#destroy', as: :log_out
end
