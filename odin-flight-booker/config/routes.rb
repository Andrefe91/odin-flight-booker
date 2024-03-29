Rails.application.routes.draw do
  # get 'bookings/index'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'passengers/index'
  # get 'passengers/new'
  # get 'passengers/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "flights#index"
  get "/flights", to: "flights#index"

  # Defines the root path route ("/")
  # root "posts#index"

  resources :bookings, only: [ :new, :create, :show]
  resources :passengers, only: [:index, :new, :create]
  resources :flights, only: [:new]
end
