Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :careers,       only: [:index, :show]
  resources :educations,    only: [:index, :show]
  resources :works,         only: [:index, :show]
  resources :attachments,   only: [:index, :show]
  resources :categories,    only: [:index, :show]
  resources :projects,      only: [:index, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
  get    '/login',  to: 'user_sessions#new',     as: :login
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy', as: :logout
end
