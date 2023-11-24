# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_mail(current_cart, order)
    @order = order
    @cart_items = current_cart.cart_items.includes([:product])
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.line_total }
    mail(to: @order.email, subject: 'ご注文ありがとうございます')
  end
end
