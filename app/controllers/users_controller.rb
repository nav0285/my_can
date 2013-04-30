class UsersController < ApplicationController

  def new
   if cookies[:key_val]=="one"
     @user = User.new(:role=>"admin")
     cookies.delete(:key_val)
   else
     @user = User.new(:role=>"guest")
   end
  end

 def create
   @user = User.new(params[:user])
   if @user.save
     redirect_to root_url, :notice => "Signed up!"
   else
     render "new"
   end
 end

end
