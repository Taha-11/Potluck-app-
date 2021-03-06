class InvitesController < ApplicationController

  def create 
     @potlock = Potlock.find params[:potlock_id]
     @invite = @potlock.invites.build(:guest_id=> params[:guest_id]) 
     @invite.user_id = current_user.id

    if @invite.save 
      # UserMailer.invitecreated_email(@invite).deliver
      redirect_to  @potlock
    else
      render "new "
  end 
end

def destroy
  @potlock = Potlock.find params[:potlock_id]
   @invite = @potlock.invites.where(id: params[:id])[0] || 
                    @potlock.inverse_invites.find_by(guest_id: params[:invite_id])
  @invite.destroy
  redirect_to @potlock
end 

  # def find
  #   @friends = User.joins(:invites).where('friends.first_name iLIKE ?', "%#{params[:invite]}%")
  #   # @friends = current_user.friendships.search(params[:friendship])
  # end 
end 