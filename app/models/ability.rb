# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new

    return unless user.present?
    can :create, User
    
    if user.no_admin?
      can [:show, :update, :destroy], User, :id => user.id
    end

    if user.admin?
      can :manage, User
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
