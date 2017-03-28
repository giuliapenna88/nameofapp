class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :orders
  # ...
  after_create :send_welcome_mail
    def send_welcome_mail
       Contact.welcome_email(self.email, self.name).deliver
    end
end
