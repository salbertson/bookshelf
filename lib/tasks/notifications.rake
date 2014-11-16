namespace :notifications do
  desc 'Notify users of new entries in the last day'
  task :new_entries => :environment do
    User.find_each do |user|
      entries = user.entries.where("published_at > ?", 1.day.ago)
      Mailer.notification(user, entries).deliver
    end
  end
end
