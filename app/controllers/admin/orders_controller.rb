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
      @total = @order_details.inject(0) { |sum, order_detail| sum + order_detail.line_total }
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
