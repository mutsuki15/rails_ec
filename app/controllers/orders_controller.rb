# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    build_order_and_credit

    if @customer.cart_items.empty?
      empty_cart
      return
    end

    ActiveRecord::Base.transaction do
      save_order_and_credit
      create_order_details
      OrderMailer.order_mail(@order).deliver_now
      @customer.cart_items.destroy_all
    end
    purchase_completed
  rescue StandardError
    shipping_infomation_error
  end

  private

  def build_order_and_credit
    @order = Order.new(order_params)
    @credit = Credit.new(credit_params)
    @customer = current_cart
    @order.customer = @customer
    @order.credit = @credit
    promotion_code = PromotionCode.find_by(id: session[:promotion_code])
    @order.promotion_code = promotion_code
  end

  def order_params
    params.require(:order).permit(
      :first_name, :last_name, :user_name, :email,
      :postal_code, :prefecture, :address1, :address2, :billing_amount
    )
  end

  def credit_params
    params.require(:order).require(:credit).permit(
      :name, :number, :expiration, :cvv
    )
  end

  def save_order_and_credit
    @order.save!
    @credit.save!
  end

  def empty_cart
    flash[:warning] = 'カートに商品が入っていません'
    redirect_to controller: 'cart_items', action: 'index'
  end

  def create_order_details
    promotion_code = PromotionCode.find_by(id: session[:promotion_code])
    @customer.cart_items.each do |cart_item|
      product = cart_item.product
      order_detail = OrderDetail.new(
        order: @order,
        product:,
        price: product.price,
        quantity: cart_item.quantity
      )
      product.update(stock: product.stock - cart_item.quantity)
      order_detail.save!
    end
    promotion_code&.update(active: false)
    session[:promotion_code] = nil
  end

  def purchase_completed
    flash[:success] = '購入ありがとうございます'
    redirect_to controller: 'products', action: 'index'
  end

  def shipping_infomation_error
    flash[:warning] = '入力内容に不備があります'
    redirect_to controller: 'cart_items', action: 'index'
  end
end
