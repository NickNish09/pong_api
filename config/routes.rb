Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [ :index, :show, :create, :update, :destroy, :new, :edit ]
    get    "/",        to: "home#index"
    get    "sign_in",  to: "sessions#new"
    post   "sign_in",  to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"
    resources :admins, only: [ :index, :show, :create, :update, :destroy, :new, :edit ]
    resource :password_reset, only: [ :create, :new, :edit ]
  end
  mount_devise_token_auth_for "User", at: "auth"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
