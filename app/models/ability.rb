class Ability
  include CanCan::Ability

   def initialize(user)
     user ||= User.new # guest user (not logged in)
     if user.role=="admin"
       can :manage, :all
     elsif user.role=="guest"
       can :create, Product
       can [:update,:delete], Product, :user_id => user.id
     else
        can :read, :all  
       #can :manage, :all if user.role=="admin"
       #can :create, :all if user.role=="guest"
     end
  end
end
