class ApplicationController < ActionController::API
  include RailsAuthorize

  rescue_from RailsAuthorize::NotAuthorizedError, with: :unauthorized

  attr_reader :current_user

  def not_found
    head 404
  end

  def unauthorized
    head 403
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
