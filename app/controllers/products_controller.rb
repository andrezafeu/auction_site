class ProductsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def index
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
		@product.id = current_user.id
		if @product.save
			flash[:notice] = "You product was saved."
			redirect_to products_path
		else
			render "new"
		end
	end
end
