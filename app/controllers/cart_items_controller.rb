class CartItemsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items.includes([:product])
  end

  def create
    @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:product_id])

    if @cart_item.new_record?
      @cart_item.quantity = params[:quantity].to_i
    else
      @cart_item.quantity += params[:quantity].to_i
    end

    if @cart_item.save
      flash[:notice] = '商品がカートに追加されました。' 
      redirect_to cart_items_path
    else
      flash.now[:alert] = 'カートへの追加に失敗しました。'
      redirect_to controller: "products", action: "index"
    end
  end

end
