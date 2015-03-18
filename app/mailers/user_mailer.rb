class UserMailer < ApplicationMailer
  default from: 'taha.iferd@gmail.com'

  def invitecreated_email(invite)
    @invite = invite
    @user = invite.user
    mail(to: invite.guest.email, subject: "You have an invitation" )
  end
end
