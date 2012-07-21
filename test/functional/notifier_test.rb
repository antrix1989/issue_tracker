require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "ticket_created" do
    mail = Notifier.ticket_created
    assert_equal "Ticket created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "ticket_updated" do
    mail = Notifier.ticket_updated
    assert_equal "Ticket updated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
