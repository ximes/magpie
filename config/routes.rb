Rails.application.routes.draw do
  resources :jobs
  root to: "homepage#index"
end
