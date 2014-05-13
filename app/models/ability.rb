class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can [:update, :destroy], Pet #that user owns
    end
  end
end
