class CommentsController < ApplicationController
  def show 
    @users= User.all
    @potlock = Potlock.find(params[:potlock_id])
    @comment = potlock.comments.build 
    @images = Image.all
    @image = Image.new
  end 

  def create 
     

    @potlock = Potlock.find(params[:potlock_id])
    @comment = @potlock.comments.new(params.require(:comment).permit([:comment]))
    @comment.user_id = current_user.id
    if @comment.save
       redirect_to @potlock
     else
      redirect_to "new "
    end 
  end 
  def destroy
    @potlock = Potlock.find(params[:potlock_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @potlock
    else
      render "new"
  end 
end 

end
