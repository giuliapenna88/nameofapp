# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("giuliapenna88@gmail.com", "Giulia", "Hi, this is just a test! I am in user_mailer_preview :)")
  end
end