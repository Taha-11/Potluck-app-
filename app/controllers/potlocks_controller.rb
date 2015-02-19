 class PotlocksController < ApplicationController
	before_action :authenticate_user!
	def index
		@potlock = Potlock.new
		@potlocks = Potlock.all
	end

	 def create
	 	potlock_params= params.require(:potlock).permit(:create, :due_time, :listing_items, :image)
	 	@potlock =Potlock.new potlock_params
	 	if @potlock.save
	 		redirect_to root_path
	 	else
	 		render 'new'
	 	end
	 end 

	 def destroy
	 	@potlock = Potlock.find (params[:id])
	 	@potlock.destroy
	 	redirect_to root_path
	 end 

end  

