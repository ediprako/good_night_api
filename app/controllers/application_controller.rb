# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_error(message, status = :internal_server_error)
    error = {
      message: message,
      status: status
    }

    render json: { error: error }, status: status
  end

  def render_success(data, status)
    resp = {
      data: data,
      status: status
    }

    render json: resp, status: status
  end
end
