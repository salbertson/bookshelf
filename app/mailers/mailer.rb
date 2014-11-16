class Mailer < ActionMailer::Base
  default from: "bookshelf@wat.com"

  def notification(user, entries)
    @entries = entries

    mail(
      to: user.email,
      subject: "New Bookshelf entries"
    )
  end
end
