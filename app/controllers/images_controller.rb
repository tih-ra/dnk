class ImagesController < ApplicationController
  before_filter :login_required
   def index
     @images = Image.all
     @image = Image.new
   end
   def create
     @image = Image.new(params[:image])
     @image.save
     redirect_to images_path
   end
   def destroy
       @image = Image.find(params[:id])
       @image.destroy
       redirect_to images_path
   end
end
