class BidsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def create
		@product = Product.find(params[:product_id])
		@bid = @product.bids.new(bid_params)
		@bid.user_id = current_user.id
		if @bid.save
			flash[:notice] = "Your bid for #{@product.title} was created."
			redirect_to product_path(@product)
		else
			render "products/show"
		end
	end

	private
	def bid_params
		params.require(:bid).permit(:value, :user_id)
	end
end
