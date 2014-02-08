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
    @parsed_feed ||= Rails.cache.fetch(url) do
      Feedzirra::Feed.fetch_and_parse(url)
    end
  end
end
