 class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo =Photo.new
    @drop = Drop.where(id:params[:drop_id]).first
  end
  def create
    @drop = Drop.where(id:params[:drop_id]).first
    # Find our user that we should attach to
    @photo = @drop.photos.new(photo_params)
    @photo.drop = @drop
    #or the standard create:
    # @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to drop_path(@drop)
    else
      render 'new'
    end
  end

  def show

  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end