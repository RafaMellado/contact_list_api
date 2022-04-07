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
    @current_user = User.find(decode_json_web_token[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end

  private

  def decode_json_web_token
    JsonWebToken.decode(split_headers(authorization_request_header))
  end

  def authorization_request_header
    request.headers['Authorization']
  end

  def split_headers(header)
    header&.split(' ')&.last
  end
end
