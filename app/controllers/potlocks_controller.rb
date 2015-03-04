class PotlocksController < ApplicationController
	before_action :authenticate_user!
	def index
		@potlocks = Potlock.all
    @search_term = params[:friendship]
    if @search_term
		  @users = User.where('users.first_name iLIKE ?', "%#{@search_term}%")
    else
      @users = User.all
    end

		@image= Image.new
		@images= Image.all
	end
		
   def new
   	@item = Item.new
   	@potlocks =Potlock.all
   	@potlock= Potlock.new
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
	 		redirect_to new_potlock_path
	 	else
	 		render 'new'
	 	end
	 end 

	 def destroy
	 	@potlock = Potlock.find (params[:id])
	 	@potlock.destroy
	 	redirect_to new_potlock_path
	 end 

end  

