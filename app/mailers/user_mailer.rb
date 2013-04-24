class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mail_to_all.subject
  #
  def mail_to_all(user, newmail)
    @user = user
    @newmail = newmail

    mail to: "#{user.name} <#{user.email}>", subject: @newmail.subject
  end
end
