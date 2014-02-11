namespace :feeds do
  desc 'Update feeds'
  task :update => :environment do
    Feed.all.each do |feed|
      temp_feed = Feedzirra::Parser::RSS.new

      temp_feed.feed_url = feed.url
      temp_feed.etag = feed.etag
      temp_feed.last_modified = feed.last_modified_at

      # Set the last entry. This step is important. 
      # This allows Feedzirra to detect if a feed that doesn't support last modified and etag has been updated.
      temp_last_entry = Feedzirra::Parser::RSSEntry.new

      last_entry = feed.entries.last

      # Do we have a last entry in the database? If so let Feedzirra know
      if last_entry
        temp_last_entry.url = last_entry.url
      end

      # Without this Feedzirra will return an empty array or some other surprise
      temp_feed.entries << temp_last_entry

      # Update the feed
      updated_feed = Feedzirra::Feed.update(temp_feed)

      entry_urls = feed.entries.pluck(:url)

      updated_feed.new_entries.each do |new_entry|
        unless entry_urls.include? new_entry.url
          feed.entries.create!(
            guid: new_entry.id,
            url: new_entry.url,
            title: new_entry.title.sanitize,
            content: (new_entry.content || new_entry.summary).sanitize,
            published_at: new_entry.published
          )
        end
      end
    end
  end
end
