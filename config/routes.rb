Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  
  root 'welcome#home'

  resources :windows
  resources :sites
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
