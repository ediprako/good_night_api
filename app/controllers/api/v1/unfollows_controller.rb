# frozen_string_literal: true

module Api
  module V1
    class UnfollowsController < ApplicationController
      def create
        follow = @current_user.follows.find_by(to_user_id: params['user_id'])
        render_error('You are not following this user') and return if follow.blank?

        follow.destroy
        render_success({}, :ok)
      end
    end
  end
end
