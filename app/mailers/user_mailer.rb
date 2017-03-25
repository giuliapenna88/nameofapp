class UserMailer < ApplicationMailer
  default from: "giulia@fahrradkit.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'giuliapenna88@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
