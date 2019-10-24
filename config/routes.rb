Rails.application.routes.draw do
  resources :categories
  resources :events
  resources :favorite_events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  get '/real/events',  to: 'events#realEvents'
# get '/categories',  to: 'events#getCategory'
get '/events/categories/:id',  to: 'events#eventByCategory'
post '/login', to: 'users#login'
end
