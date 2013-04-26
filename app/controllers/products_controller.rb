class ProductsController < ApplicationController

 before_filter :self_load, :only=>[:show,:edit,:update,:destroy]

 before_filter :authenticate_user, :only=>[:new, :edit,:update,:destroy]

authorize_resource :only=>[:create, :edit, :update,:delete]

   def index
    @products=Product.find(:all)
   end

   def new 
    @product=Product.new(:user_id=>current_user.id)
   end


   def create
     @product=Product.new(params[:product])
     if @product.save
        redirect_to root_url, :notice=>'New Product has been added'
     else
        render :action=>'new'
     
     end
   end  
 
   def show
   end

   def edit
   end
  
   def update
    if @product.update_attributes(params[:product])
       redirect_to root_url, :notice=>'Product has been updated.'
      else
         render :action => 'edit'
      end
   end

   
  def destroy
    @name=@product.title
    @product.destroy
    redirect_to root_url, :notice=>"#{@name} has been deleted"    
  end
 
  def self_load
    @product = Product.find(params[:id])
  end

  def authenticate_user
    if current_user
    else
       redirect_to root_url, :notice=>'You are not authorised to access'
    end
  end
end
