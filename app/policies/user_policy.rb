class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.moderator?
  end
  def show?
    record.try(:user) == user || user.admin? || user.moderator?
  end
  def update?
    record.try(:user) == user
  end
  def destroy?
    user.admin? || record.try(:user) == user
  end
  def create?
    true
  end
end
