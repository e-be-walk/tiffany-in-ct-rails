Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/logout' => 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/about' => 'welcome#about'
  get '/index' => 'welcome#index'
  root 'welcome#home'


  resources :users
    resources :sites, only: [:create, :new, :show, :update, :destroy]
    resources :windows, only: [:create, :new, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
