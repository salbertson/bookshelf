namespace :feeds do
  desc 'Fetch new feed entries'
  task :fetch_entries => :environment do
    Feed.all.each do |feed|
      parsed_feed = Feedzirra::Feed.fetch_and_parse(feed.url)
      entry_urls = feed.entries.pluck(:url)

      parsed_feed.entries.each do |entry|
        unless entry_urls.include? entry.url
          feed.entries.create!(
            guid: entry.id,
            url: entry.url,
            title: entry.title.sanitize,
            content: (entry.content || entry.summary).sanitize,
            published_at: entry.published
          )
        end
      end
    end
  end
end
