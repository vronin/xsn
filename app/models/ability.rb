class Ability
  include CanCan::Ability

  def initialize(user)
    # Admin can do whatever he wants
    can :manage, :all if user.role == "admin"

    # Managers can publish/unpublish events and do other event related stuff
    can :manage, [Event] if user.role == "manager"

    # Researches and Managers are allowed to see dashboard and manage ideas and researches                
    if user.role == "manager" or user.role == "researcher"   
      can :access, :rails_admin
      can :dashboard
      can :manage, [Idea, Research]
    end
    
  end
  
end
