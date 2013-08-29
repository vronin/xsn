class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.role == "admin"
      can :manage, :all               # allow admins to do anything
    end
  end
end
