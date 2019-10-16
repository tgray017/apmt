class StatusPolicy < ApplicationPolicy

  def initialize(user, status)
    @user = user
    @status = status
  end

  def create?
    @user.is_admin?
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
