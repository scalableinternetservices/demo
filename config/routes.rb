# frozen_string_literal: true

Rails.application.routes.draw do
  root 'submissions#index'

  resources :comments, only: %w[create destroy new]

  resources :communities, only: %w[create destroy new show]

  resources :submissions, only: %w[create destroy new show]
end
