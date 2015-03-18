class PotlocksController < ApplicationController
	before_action :authenticate_user!
	def index
    @friendship_count = Friendship.count 
		@potlocks = Potlock.all
    @search_term = params[:friendship]
    if @search_term
		  @users = User.where('first_name iLIKE ? OR last_name iLIKE ?', "%#{@search_term}%", "%#{@search_term}%")
    else
      @users = []
    end
		@image= Image.new
		@images= Image.all
    @friends = []
end

   def new 
    
    end 
		
   def show

      @search_term = params[:invite]
    if @search_term
      @users = User.where('users.first_name iLIKE ?', "%#{@search_term}%")
    else
      @users = []
   end 

   	@item = Item.new
   	@potlock= Potlock.find(params[:id])
   	@image= Image.new
		@images= Image.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
            marker.lat user.latitude
            marker.lng user.longitude
         end 
   end

	 def create
	 	potlock_params= params.require(:potlock).permit(:create,:due_date,:meal,:address, :longtitude, :latitude)
	 	@potlock =Potlock.new potlock_params
	 	
	 	if @potlock.save
	 		redirect_to @potlock
	 	else
	 		render 'new'
	 	end
	 end 

	 def destroy
	 	@potlock = Potlock.find (params[:id])
	 	@potlock.destroy
	 	redirect_to potlocks_path
	 end 

end  

