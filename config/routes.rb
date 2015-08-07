Rails.application.routes.draw do
  root :to => 'users#index'

  resources :sessions
  resources :user_mailer

  resources :users

  resources :questions do
  resources :answers


    end
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  end
end
