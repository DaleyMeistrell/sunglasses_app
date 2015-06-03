class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by(name: params[:name])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params.require(:product).permit(:name, :price, :weight, :inventory, :description))
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end
end
