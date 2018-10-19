Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'submissions#index'

  resources :comments, only: %w[create destroy new]

  resources :communities, only: %w[create destroy new show]

  resources :submissions, only: %w[create destroy new show]
end
