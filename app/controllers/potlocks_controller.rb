class PotlocksController < ApplicationController
	before_action :authenticate_user!
	def index
    @friendships =Friendship.paginate(:page => params[:page], :per_page => 3)
		@potlock = Potlock.new
    @search_term = params[:friendship]
    @potlocks = Potlock.all
    if @search_term
		  @users = User.where('first_name iLIKE ? OR last_name iLIKE ?', "%#{@search_term}%", "%#{@search_term}%")
    else
      @users = []
    end
		@image= Image.new
		@images= Image.all
end

   def new 
    
    end 
		
   def show
      @potlock = Potlock.new
      @comments = Comment.all
      @comment = Comment.new 
      @search_term = params[:invite]
    if @search_term
      @users = User.where('users.first_name iLIKE ?', "%#{@search_term}%")
    else
      @users = []
   end 

   	@item   = Item.new
   	@potlock= Potlock.find(params[:id])
   	@image  = Image.new
		@images  = Image.all
		@hash    = Gmaps4rails.build_markers(@users) do |user, marker|
            marker.lat user.latitude
            marker.lng user.longitude
         end 
   end

	 def create
	 	potlock_params= params.require(:potlock).permit(:create,:due_date,:meal,:address, :longtitude, :latitude)
	 	@potlock =Potlock.new potlock_params
    @potlock.user_id = current_user.id
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

