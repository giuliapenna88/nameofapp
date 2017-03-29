class UserMailer < ApplicationMailer
	default from: "giuliapenna88@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'giuliapenna88@gmail.com',
		:subject => "A new contact form message from #{name}")
	end
	def welcome_email(user)
		@user = user
		mail( :to => @user.email,
		:subject => 'Thanks for signing up for our amazing app' )
	end
end
