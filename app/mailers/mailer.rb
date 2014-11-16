class Mailer < ActionMailer::Base
  default from: "bookshelf@wat.com"

  def notification(user, entries)
    @entries = entries

    mail(
      to: user.email,
      subject: "New entries in the last week"
    )
  end
end
