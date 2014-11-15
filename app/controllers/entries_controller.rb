class EntriesController < ApplicationController
  def show
    feed = current_user.feeds.find(params[:feed_id])
    @entry = feed.entries.find(params[:id])
  end
end
