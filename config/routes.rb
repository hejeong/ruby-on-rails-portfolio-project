Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/currentuser' => 'users#current_user'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:create, :show]
  resources :items, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :items, only: [:show] do 
    post '/purchase' => 'transactions#create'
    resources :comments, only: [:new, :create, :index, :show]
  end
end
