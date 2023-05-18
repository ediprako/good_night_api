# frozen_string_literal: true

module Api
  module V1
    class FollowsController < ApplicationController
      def index
        render_success(UserFollowsSerializer.new(@current_user.follows).to_h, :ok)
      end

      def create
        @user_follow = @current_user.follows.find_or_initialize_by(to_user_id: create_params)
        render_error("Already follow user #{@user_follow.to_user.id}") and return unless @user_follow.new_record?

        @user_follow.save!
        render_success({}, :ok)
      end

      def last_week_activity
        last_week_activity = @current_user.follows_sleeps(1.weeks.ago)
        render_success(SleepSerializer.new(last_week_activity).to_h, :ok)
      end

      private

      def create_params
        params.require(:user_id)
      end
    end
  end
end
