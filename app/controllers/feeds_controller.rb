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
    @feed = current_user.feeds.find_or_create_by(url: params[:feed][:url])

    if @feed.persisted?
      redirect_to root_path, notice: 'Feed was added!'
    else
      render :new
    end
  end
end
