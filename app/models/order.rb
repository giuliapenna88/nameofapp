class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  after_create :send_order_create_mail
  def send_order_create_mail
    UserMailer.order_created_email(self).deliver
  end
end
