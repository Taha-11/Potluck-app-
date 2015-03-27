class CommentsController < ApplicationController
  def show 
    @potlock = Potlock.find(params[:potlock_id])
    @commnet = potlock.comments.build 
  end 

  def create 
    @potlock = Potlock.find(params[:potlock_id])
    @comment = @potlock.comments.new(params.require(:comment).permit(:comment))
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
