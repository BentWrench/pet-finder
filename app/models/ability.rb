class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify
    if user
      if user.role == 'admin'
        can :manage, :all
      elsif user.role == 'user'
        # can :create, User
        can :modify, User do |profile|
          profile == user
        end

        can [:read, :create], Pet
        can :modify, Pet do |pet|
          pet.try(:user) == user
        end
      end
    else
      can :read, Pet
    end
  end
end
