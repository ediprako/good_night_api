# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    access_token = request.headers['Authorization']&.split&.last
    @current_user = User.find_by access_token: access_token
    render_error('Invalid authorization', :unauthorized) if @current_user.blank?
  end

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
