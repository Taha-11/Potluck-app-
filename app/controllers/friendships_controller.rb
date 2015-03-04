class FriendshipsController < ApplicationController

  def create 
    @friendships= Friendship.all
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])   
    if @friendship.save
      flash[:notice] = "added"
      redirect_to root_path
    else 
      render 'new'
    end
  end 
   
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to root_path
  end

  def find
    @friends = User.joins(:friendships).where('friends.first_name iLIKE ?', "%#{params[:friendship]}%")
    # @friends = current_user.friendships.search(params[:friendship])
  end 
end

