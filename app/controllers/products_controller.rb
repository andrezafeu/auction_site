class ProductsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def index
		@products = Product.order(created_at: :desc).limit(10)
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(
			:title => params[:product][:title],
			:description => params[:product][:description],
			:bidding => params[:product][:bidding]
			)
		@product.user_id = current_user.id
		if @product.save
			flash[:notice] = "You product was saved."
			redirect_to products_path
		else
			render "new"
		end
	end
	def show
		@product = Product.find_by(id: params[:id])	
		unless @product
			render "no_products_found"
		end
	end
end
