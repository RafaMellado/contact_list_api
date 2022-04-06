class ContactBookPolicy < ApplicationPolicy
  def scope
    ContactBook.where(user_id: @user.id)
  end

  def index?
    true
  end

  def create?
    user_is_owner_of_contact_book?
  end

  def show?
    user_is_owner_of_contact_book?
  end

  def update?
    user_is_owner_of_contact_book?
  end

  def destroy?
    user_is_owner_of_contact_book?
  end

  private

  def user_is_owner_of_contact_book?
    @record.user_id == @user.id
  end
end
