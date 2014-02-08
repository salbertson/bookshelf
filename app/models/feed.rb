class Feed < ActiveRecord::Base
  belongs_to :user

  def title
    parsed_feed.title
  end

  def entries
    parsed_feed.entries
  end

  private

  def parsed_feed
    @parsed_feed ||= Feedzirra::Feed.fetch_and_parse(url)
  end
end
