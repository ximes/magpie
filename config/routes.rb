Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }

  resources :jobs do
    member do
      post "perform", to: "jobs#perform"
      post "perform_preview", to: "jobs#perform_preview"
    end
  end
  resources :rules do
    patch "move", to: "rules#move", on: :member
  end
  root to: "homepage#index"

  require "sidekiq/web"
  require "sidekiq/cron/web"

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end
end
