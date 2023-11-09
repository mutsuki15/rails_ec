# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]

  def index
    @cart_items = current_cart.cart_items.includes([:product])
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.line_total }
  end

  def create
    @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:cart_item][:product_id])

    if @cart_item.new_record?
      @cart_item.quantity = params[:cart_item][:quantity].to_i
    else
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    end

    if @cart_item.quantity > @cart_item.product.stock
      flash[:warning] = 'ご希望する数量の在庫がありませんでした。'
      redirect_to controller: 'products', action: 'index'
      return
    end

    if @cart_item.save
      flash[:success] = '商品がカートに追加されました。'
    else
      flash.now[:warning] = 'カートへの追加に失敗しました。'
    end
    redirect_to controller: 'products', action: 'index'
  end

  def destroy
    @cart_item.destroy
    flash[:success] = '商品が削除されました。'
    redirect_to cart_items_path
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find(params[:id])
  end
end
