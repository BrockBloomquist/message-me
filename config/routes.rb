Rails.application.routes.draw do
  resources :users 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "chatroom#index"
  get "login", to: "sessions#new"
  post 'login', to: "sessions#create"
  get "signup", to: "users#new"
  delete "logout", to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'friends', to: 'users#friends'
  post 'add-friends(/:id)', to: "users#add_friend", as: :add_friend
  get 'requests', to: "users#requests"
end
