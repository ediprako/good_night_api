# frozen_string_literal: true

module Api
  module V1
    class AppController < ApplicationController
      skip_before_action :authenticate!
      def index
        render json: { status: :ok }
      end
    end
  end
end
