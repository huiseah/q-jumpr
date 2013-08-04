QJumpr::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create]
  resources :bids, :only => [:index, :new, :create]
  resources :offers, :only => [:index, :new, :create]

  get '/login' => 'session#new'
  post 'login' => 'session#create'
  get '/logout' => 'session#destroy'
end
