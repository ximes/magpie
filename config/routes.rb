Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }

  resources :jobs
  resources :rules do 
    patch "move", to: "rules#move", on: :member
  end
  root to: "homepage#index"
end
