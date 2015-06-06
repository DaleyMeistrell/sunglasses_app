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
		@product = Product.new(params.require(:product).permit(:name, :price, :weight, :inventory, :description, :image))
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find_by(name: params[:name])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params.require(:product).permit(:name, :price, :weight, :inventory, :description, :image))
			redirect_to product_path(@product.name)
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path 
	end

	
  # 	private
  # 	def product_params
  #   params.require(:product).permit(:title, :body, :image)
 	# end
end
