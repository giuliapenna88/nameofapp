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
		mail( :to => @user.email,
		:subject => 'Welcome to Fahrradkit!' )
	end
	def order_created_email(order)
	@order = order
	mail(:from => 'giuliapenna88@gmail.com',
			:to => order.user.email,
			:subject => "Your Order ID: #{order.id} ")
end
end
