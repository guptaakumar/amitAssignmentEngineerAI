Rails.application.routes.draw do
  get "home/index"
  devise_for :users, path: "users", controllers: { registrations: "registrations"},
    path_names: { sign_in: "login", sign_up: "register" }
  authenticate :user, ->(u) { u.admin? } do
    resources :secret_codes
    root "secret_codes#index"
  end
  authenticate :user, ->(u) { u.user? } do
    root "home#index"
  end
end
