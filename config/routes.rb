Rails.application.routes.draw do
  get '/careers',     to: 'careers#index'
  get '/career/:id',  to: 'careers#show'
end
