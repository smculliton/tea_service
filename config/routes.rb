Rails.application.routes.draw do
  get '/subscriptions', to: 'subscriptions#index'
  post '/subscriptions', to: 'subscriptions#create'
  patch '/subscriptions', to: 'subscriptions#edit'

  get '/teas', to: 'teas#index'
end
