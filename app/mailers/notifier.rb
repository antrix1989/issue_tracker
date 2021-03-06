class Notifier < ActionMailer::Base
  default from: "support@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.ticket_created.subject
  #
  def ticket_created(ticket)
    @ticket = ticket

    mail to: @ticket.customer_email, subject: "Your ticket is created!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.ticket_updated.subject
  #
  def ticket_updated(comment)
    @comment = comment

    mail to: @comment.ticket.customer_email, subject: "Your ticket is updated!"
  end
end
