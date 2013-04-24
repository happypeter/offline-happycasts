require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "mail_to_all" do
    mail = UserMailer.mail_to_all
    assert_equal "Mail to all", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
