class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can [:show, :create], User
      can :modify, User do |profile|
        profile == user
      end

      can [:read, :create], Pet
      can :modify, Pet do |pet|
        pet.try(:user) == user
      end
    end
  end
end
