class ItemsController < ApplicationController
   def show
   @potlock= Potlock.find(params[:potlock_id]) 
   @item = potlock.items.build
   @image = Image.new
end 

  def claim
    # @image = Image.new
    @potlock = Potlock.find(params[:potlock_id])
    @item = Item.find(params[:id])
    @item.user_id = current_user.id
    @item.save

    redirect_to @potlock
  
  end


  

  def create
  # render text: params.to_s
   @potlock = Potlock.find(params[:potlock_id])
   @item = @potlock.items.new(params.require(:item).permit([:name]))
     if @item.save
     redirect_to @potlock
     else
     redirect_to 'new'
   end
  end 
 
  def destroy
    @potlock = Potlock.find params[:potlock_id]
    @item = Item.find params[:id]
    @item.destroy
    redirect_to @potlock   
  end
end 
