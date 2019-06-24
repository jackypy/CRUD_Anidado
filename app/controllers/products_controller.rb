class ProductsController < ApplicationController

  def Index
    @products = Products.all
  end

  def new
    @product = Product.new(product_params)
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category = @category
    @product.save
    redirect_to category_path(:id)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.delete
    redirect_to category_path(@category)

  end
  private
  def products_params
    params.requiere(:product).permit(:name, :prices)
  end
end
