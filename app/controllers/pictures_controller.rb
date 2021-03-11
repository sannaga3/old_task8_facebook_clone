class PicturesController < ApplicationController
  def index
    @picture = Picture.all
  end

  def new
    if params[:back]
      @picture = Feed.new(feed_params)
    else
      @picture = Feed.new
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
end
