class ProductsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def index
		@products = Product.order(created_at: :desc).limit(10)
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
		if @product.save
			flash[:notice] = "You product was saved."
			redirect_to products_path
		else
			flash.now[:alert] = "The bid couldn't be created. Please try again."
			render "new"
		end
	end
	def show
		@product = Product.find_by(id: params[:id])
		if @product
			@bid = @product.bids.new
			@bids = @product.bids.order(value: :desc)
		else
			render "no_products_found"
		end
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :bidding)
	end
end
