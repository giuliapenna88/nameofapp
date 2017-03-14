class Product < ApplicationRecord
  has_many :orders
  def self.search(search_term)
      app_name = "redacted"
      if Rails.env.development?
  				Product.where("name LIKE ?", "%#{search_term}%")
      elsif Rails.env.production?
      	  Product.where("name LIKE ?", "%#{search_term}%")
      end
    end
end


		
