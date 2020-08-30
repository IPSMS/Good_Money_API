Rails.application.routes.draw do
  resources :action_infos
  resources :stats
  resources :users
    post '/login', to: 'auth#login'
    post '/signup', to: 'users#create'
    get '/profile', to: 'users#profile'
    get '/usertotal/:id', to: 'users#user_total'
    get '/userdailytotal/:id', to: 'users#user_daily_total'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
