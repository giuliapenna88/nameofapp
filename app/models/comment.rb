class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }
  def destroy
  	@comment = Comment.find(params[:id])
  	product = @comment.product
  	@comment.destroy
  	redirect_to product
	end
end

