# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      after_action :set_headers
      def sleep_history
        @sleeps = @current_user.sleeps.order(created_at: :desc)
                               .page(params['page'] || 1).per(params['limit'] || 10)
        render_success(SleepSerializer.new(@sleeps).to_h, :ok)
      end

      private

      def set_headers
        headers['X-Total-Page'] = @sleeps.total_pages
        headers['X-Prev-Page'] = @sleeps.prev_page if @sleeps.prev_page.present?
        headers['X-Current-Page'] = @sleeps.current_page
        headers['X-Next-Page'] = @sleeps.next_page if @sleeps.next_page.present?
      end
    end
  end
end
