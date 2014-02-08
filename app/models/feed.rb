class Feed < ActiveRecord::Base
  belongs_to :user

  has_many :entries, dependent: :destroy

  before_create :fetch_feed

  private

  def fetch_feed
    feed = Feedzirra::Feed.fetch_and_parse(url)
    self.title = feed.title.sanitize
    self.etag = feed.etag
    self.last_modified_at = feed.last_modified

    feed.entries.each do |entry|
      entries << Entry.new(
        guid: entry.id,
        url: entry.url,
        title: entry.title.sanitize,
        content: entry.content.sanitize,
        published_at: entry.published
      )
    end
  end
end
