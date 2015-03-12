class ItemsController < ApplicationController
   def new
   @potlock= Potlock.find(params[:potlock_id]) 
   @item = potlock.items.build
end 

  def claim
    @potlock = Potlock.find(params[:potlock_id])
    @item = Item.find(params[:id])
    @item.user = current_user
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
