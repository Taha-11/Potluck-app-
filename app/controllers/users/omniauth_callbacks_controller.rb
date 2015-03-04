class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 def facebook
  
 omniauth_data = request.env["omniauth.auth"].to_hash
   user = User.find_or_create_from_facebook(omniauth_data)
  # render json: omniauth_data

 if user
   sign_in user
   redirect_to potlocks_path, notice: "welcome"
 else
   redirect_to root_path, alert: "Sorry!"
 end
 end
 

def index
  user =  User.find_all_by_name(User.find(params[:id]).name) 
  @users = User.search(params[:search])
end


end 