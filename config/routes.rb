Rails.application.routes.draw do

  get '/auth/:provider/callback' => 'sessions#create'

  get '/' => 'sessions#welcome'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :stories
  resources :stories, only: [:show] do
    resources :contributions, only: [:new, :index, :show]
  end

  resources :contributions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
