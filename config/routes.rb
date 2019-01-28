Rails.application.routes.draw do
  resources :careers,    only: [:index, :show]
  resources :educations, only: [:index, :show]
  resources :works,      only: [:index, :show]
end
