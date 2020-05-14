Rails.application.routes.draw do
  resources :videos
  resources :signs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/log-in", to: "users#log_in"
  get "/validate", to: "users#validate"
end

