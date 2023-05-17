# frozen_string_literal: true

module Api
  module V1
    class SleepController < ApplicationController
      def clock_in
        sleep = @current_user.sleeps.find_or_initialize_by(date: Date.current)
        render_error("already clock_in at #{sleep.clock_in}") unless sleep.new_record?
        sleep.update!(clock_in: Time.current)
        render_success(SleepSerializer.new(sleep).to_h, :ok)
      end
    end
  end
end
