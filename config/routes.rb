Rails.application.routes.draw do
  devise_for :users
  root :to => 'questions#index'

  resources :users do
    resources :questions
  end

    resources :questions do
      resources :answers
  end
end
