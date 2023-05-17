# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'app', to: 'app#index'
      post 'auth', to: 'auth#login'

      resources :sleep, only: [] do
        collection do
          post :clock_in
        end
      end
    end
  end
end
