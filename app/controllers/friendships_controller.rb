class FriendshipsController < ApplicationController

  def create

    @friendships= Friendship.all
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id]) 
    @friendship.save 
    redirect_to root_path

  end 
   
  def destroy
     @friendship = current_user.friendships.where(id: params[:id])[0] || 
                    current_user.inverse_friendships.find_by(friend_id: params[:friendship_id])
    @friendship.destroy
    redirect_to root_path
  end


  # def find
  #   @friends = User.joins(:friendships).where('users.first_name iLIKE ?', "%#{params[:friendship]}%")
  #   # @friends = current_user.friendships.search(params[:friendship])
  # end 
end

