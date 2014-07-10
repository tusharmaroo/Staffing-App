class UserMailer < ActionMailer::Base
  default from: "donotreply@tusharmaroo.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://staffingApp.com/'
    mail(to: @user.emailid, subject: 'Welcome to Staffing App 1.0 ')
  end
end
