Rails.application.routes.draw do
  namespace :api do
    resources :communities, only: %w[index create destroy show]
    resources :submissions, only: %w[index create destroy new show]
  end

  root 'submissions#index'

  resources :comments, only: %w[create destroy new]
  resources :communities, only: %w[create destroy new show]
  resources :submissions, only: %w[index create destroy new show]
end
