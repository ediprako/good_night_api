# frozen_string_literal: true

module Api
  module V1
    class SleepsController < ApplicationController
      def clock_in
        sleep = @current_user.sleeps.find_or_initialize_by(date: Date.current)
        render_error("already clock_in at #{sleep.clock_in}") and return unless sleep.new_record?

        sleep.update!(clock_in: Time.current)
        render_success(SleepSerializer.new(sleep).to_h, :ok)
      end

      def clock_out
        sleep = @current_user.sleeps.find(sleep_id)
        render_error('invalid sleep id', :unprocessable_entity) and return if sleep.blank?

        sleep.update!(clock_out: Time.current)
        render_success(SleepSerializer.new(sleep).to_h, :ok)
      end

      private

      def sleep_id
        params['id'] || params['sleep_id']
      end
    end
  end
end
