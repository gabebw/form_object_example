Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:create]

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"

  root "homes#show"
end
