# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'app', to: 'app#index'
      post 'auth', to: 'auth#login'

      resources :user, only: [] do
        collection do
          get :sleep_history, to: 'user#sleep_history'
        end
      end

      resources :sleep, only: [] do
        post :clock_out
        collection do
          post :clock_in
        end
      end
    end
  end
end
