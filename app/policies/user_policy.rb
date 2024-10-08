class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    true
  end

  def update?
    user.admin? || record == user
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
