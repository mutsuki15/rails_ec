# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def line_total
    price * quantity
  end
end
