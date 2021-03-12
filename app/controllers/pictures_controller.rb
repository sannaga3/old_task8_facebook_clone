class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = params[:id] ? Picture.find(param[:id]) : Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.id?
      render :edit and return if @picture.invalid?
    else
      render :new and return if @picture.invalid?
    end
  end

  def create

  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def picture_params
    params.require(:picture).permit(:content)
  end
end
