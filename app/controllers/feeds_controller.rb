class FeedsController < ApplicationController
  def index
    @feeds = current_user.feeds
  end

  def show
    @feed = current_user.feeds.find(params[:id])
  end

  def new
    @feed = current_user.feeds.new
  end

  def create
    @feed = current_user.feeds.new(feed_params)

    if @feed.save
      redirect_to root_path, notice: 'Feed was added!'
    else
      render :new
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:name, :url)
  end
end
