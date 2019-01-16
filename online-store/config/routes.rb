Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:create, :show]
  resources :items, only: [:new, :create, :index]
  resources :items, only: [:show] do 
    post '/purchase' => 'transactions#create'
  end
end
