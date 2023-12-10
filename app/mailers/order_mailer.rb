# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_mail(order)
    @order = order
    @order_details = @order.order_details
    @total = if @order.promotion_code.present?
               @order_details.inject(0) do |sum, order_detail|
                 sum + order_detail.line_total - @order.promotion_code.discount_amount
               end
             else
               @order_details.inject(0) { |sum, order_detail| sum + order_detail.line_total }
             end
    mail(to: @order.email, subject: 'ご注文ありがとうございます')
  end
end
