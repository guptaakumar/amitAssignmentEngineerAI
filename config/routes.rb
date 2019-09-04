Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: { registrations: "registrations"},
    path_names: { sign_in: "login", sign_up: "register" }
  resources :secret_codes
  root "secret_codes#index"
end
