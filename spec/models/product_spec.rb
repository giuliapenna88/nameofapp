require 'rails_helper'

describe Product do
	context "when the product has comments" do

		before do

			@product = Product.create!(name: "race bike", description: "black", price: 150)
			@user = FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "just fine")
			@product.comments.create!(rating: 5, user: @user, body: "Best bike ever!")

		end

		it "returns the average rating of all comments" do

			expect(@product.average_rating).to eq 3

		end
	end

	context "product not valid" do

		it "description only returns not valid" do

			expect(Product.new(description: "Nice!")).not_to be_valid

		end
	end
end
