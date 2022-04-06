class ApplicationPolicy
  attr_reader :user, :record, :context

  def initialize(user, record, context)
    @user = user
    @record = record
    @context = context
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
