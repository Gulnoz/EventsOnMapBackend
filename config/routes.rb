Rails.application.routes.draw do
  resources :user_events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/events',  to: 'events#index'
get '/categories',  to: 'events#getCategory'
get '/events/categories/:id',  to: 'events#eventByCategory'
post '/login', to: 'users#login'
end
