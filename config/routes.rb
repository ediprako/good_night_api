# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'api/v1/app#index'
  namespace :api do
    namespace :v1 do
      get 'app', to: 'app#index'
      post 'auth', to: 'auth#login'

      resources :users, only: [] do
        resources :follows, only: %i[create]
        resources :unfollows, only: %i[create]

        collection do
          get :sleep_records

          resources :follows, only: %i[index] do
            get :last_week_activity, on: :collection
          end
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
