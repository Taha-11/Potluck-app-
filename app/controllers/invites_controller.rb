class InvitesController < ApplicationController
  def create 
     @potlock = Potlock.find params[:potlock_id]
     @friendships= Friendship.all
     @invite = current_user.invites.build(:guest_id=> params[:guest_id]) 
     @invite.potlock = @potlock
    if @invite.save 
      redirect_to  @potlock
    else
      render "new "
  end 
end

def destroy
  @potlock = Potlock.find params[:potlock_id]
  @invite = Invite.find(params[:id])
  @invite.destroy
  redirect_to @potlock
end 

  def find
    @friends = User.joins(:invites).where('friends.first_name iLIKE ?', "%#{params[:invites]}%")
    # @friends = current_user.friendships.search(params[:friendship])
  end 
end 