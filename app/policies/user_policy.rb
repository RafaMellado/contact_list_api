class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    logged_user?
  end

  def update?
    logged_user?
  end

  def destroy?
    logged_user?
  end

  private

  def logged_user?
    @record.user_id == @user.id
  end
end
