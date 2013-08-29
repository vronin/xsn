class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "admin"
      can :manage, :all               
    elsif user.role == "manager"
      can :access, :rails_admin
      can :dashboard
      can :manage, [Idea, Event, Research]
    elsif user.role == "researcher"      
      can :access, :rails_admin
      can :dashboard
      can :manage, [Idea, Research]      
    end
  end
end
