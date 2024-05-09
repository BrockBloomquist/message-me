Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  


  # Defines the root path route ("/")
  root "chatroom#index"
  get "login", to: "sessions#new"
  post 'login', to: "sessions#create"
  get "signup", to: "users#new"
  delete "logout", to: 'sessions#destroy'
end
