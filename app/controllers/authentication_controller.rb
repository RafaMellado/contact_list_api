class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = find_user

    if @user&.authenticate(params[:password])
      render json: { token: encode_json_web_token, exp: expiration_time,
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: 422
    end
  end

  private

  def find_user
    User.find_by_email(params[:email])
  end

  def encode_json_web_token
    JsonWebToken.encode(user_id: @user.id)
  end

  def expiration_time
    (Time.now + 24.hours.to_i).strftime('%m-%d-%Y %H:%M')
  end

  def login_params
    params.permit(:email, :password)
  end
end
