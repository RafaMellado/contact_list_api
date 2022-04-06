class ContactPolicy < ApplicationPolicy
  def scope
    Contact.includes(:contact_book).where(contact_book: { user_id: @user.id })
  end

  def index?
    true
  end

  def create?
    user_is_owner_of_contact?
  end

  def show?
    user_is_owner_of_contact?
  end

  def update?
    user_is_owner_of_contact?
  end

  def destroy?
    user_is_owner_of_contact?
  end

  private

  def user_is_owner_of_contact?
    @record.owner_user_id == @user.id
  end
end
