class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :show, :update,:destroy]
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
    @picture = params[:id] ? Picture.find(params[:id]) : Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.id?
      render :edit and return if @picture.invalid?
    else
      render :new and return if @picture.invalid?
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:back]
      render :edit
    else
      if @picture.save
        redirect_to picture_path(@picture.id), notice: "編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end
  

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:content, :id)
  end
end
