QJumpr::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create]
  resources :bids, :only => [:new, :create]
  resources :offers, :only => [:index, :new, :create, :show]

  get 'offer/winner' => 'bids#make_bid_winner'

  get '/login' => 'session#new'
  post 'login' => 'session#create'
  get '/logout' => 'session#destroy'
end
