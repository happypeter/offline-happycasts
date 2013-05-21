class SendmailsController < ApplicationController

  def newmail
    @sendmail = Sendmail.new
  end

  def sendmail

    @mail = Sendmail.new(params[:sendmail])

    if @mail.save
      User.all.each do |user|
        UserMailer.mail_to_all(user, @mail).deliver
      end
    end
    redirect_to root_path, notice: 'send all mails complete!'

  end

end
