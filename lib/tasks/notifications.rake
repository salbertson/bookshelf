namespace :notifications do
  desc 'Notify users of new entries in the last week'
  task :new_entries => :environment do
    User.find_each do |user|
      entries = user.entries.where("published_at > ?", 1.week.ago)
      Mailer.notification(user, entries).deliver
    end
  end
end
