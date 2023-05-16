module Api
  module V1
    class AppController < ApplicationController
      def index
        render json: {status: :ok}
      end
    end
  end
end
