# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.all.where.not(id: @product).order(updated_at: :asc).first(4)
  end
end
