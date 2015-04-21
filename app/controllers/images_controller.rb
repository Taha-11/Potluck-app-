class ImagesController < ApplicationController
  def index
    @image= Image.new
    @images = Image.all
  end

  def show
      @image= Image.new
    @images = Image.all
  end 

  def create
    image_params= params.require(:image).permit(:image)
    @image =Image.new image_params
    @image.user = current_user
    if @image.save
      redirect_to root_path
    else
      render 'new'
    end
   end 
   def destroy
    @image = Image.find (params[:id])
    @image.destroy
    redirect_to root_path
   end
end
