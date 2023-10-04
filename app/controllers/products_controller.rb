class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @rerated_products = Product.all.where.not(id: @product).order(updated_at: :asc)
  end
 
end
