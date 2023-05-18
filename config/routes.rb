# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'app', to: 'app#index'
      post 'auth', to: 'auth#login'

      resources :users, only: [] do
        resources :follows, only: %i[index create]
        resources :unfollows, only: [:create]
        collection do
          get :sleep_records
        end
      end

      resources :sleeps, only: [] do
        post :clock_out
        collection do
          post :clock_in
        end
      end
    end
  end
end
