class FeedsController < ApplicationController
  before_filter :authorize_user

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
