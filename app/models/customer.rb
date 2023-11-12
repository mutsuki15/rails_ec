# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
end
