# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate!
      def login
        user = User.find_by(name: login_params)

        render_error('User not found', :not_found) and return if user.blank?

        render_success({ access_token: user.access_token }, :ok)
      end

      private

      def login_params
        params.require(:name)
      end
    end
  end
end
