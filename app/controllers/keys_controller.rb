class KeysController < ApplicationController

  def new 
    @key=Key.new(:val => cookies[:key_va])
  end
 
  def create 
    @key=Key.new(params[:key])
    if @key.save
        cookies[:key_val]=@key.val
        redirect_to new_user_path
    else
        flash.now[:notice]='wrong key entered'
        render 'new'
    end
     
  end

end
