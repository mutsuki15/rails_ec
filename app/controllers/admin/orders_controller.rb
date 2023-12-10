# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @credit = @order.credit
      @total = if @order.promotion_code.present?
                 @order_details.inject(0) do |sum, order_detail|
                   sum + order_detail.line_total - @order.promotion_code.discount_amount
                 end
               else
                 @order_details.inject(0) { |sum, order_detail| sum + order_detail.line_total }
               end
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
