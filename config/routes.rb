Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations" }

  resources :jobs
  root to: "homepage#index"
end
