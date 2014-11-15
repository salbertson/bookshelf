class Entry < ActiveRecord::Base
  belongs_to :feed

  def feed_title
    feed.title
  end
end
