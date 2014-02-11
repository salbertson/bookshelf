class FeedsController < ApplicationController
  def index
    @feeds = current_user.feeds
  end

  def show
    @feed = current_user.feeds.find(params[:id])
    @entries = @feed.entries.order(published_at: :desc)
  end

  def new
    @feed = current_user.feeds.new
  end

  def create
    feed = Feed.where(url: params[:feed][:url]).first_or_initialize
    current_user.feeds << feed

    if current_user.feeds.include? feed
      redirect_to root_path, notice: 'Feed was added!'
    else
      render :new
    end
  end
end
