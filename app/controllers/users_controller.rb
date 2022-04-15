class UsersController < ApplicationController
  # POST /users
  def create
    @user = User.new(create_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.details },
             status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(
      :username, :email, :password, :password_confirmation
    )
  end
end
