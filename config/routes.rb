Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'sessions#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
resources :users, only: %i[create new show]
resources :events, only: %i[create new show index]
end
