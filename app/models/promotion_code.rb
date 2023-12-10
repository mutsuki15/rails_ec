# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  validates :code, presence: true
  has_many :orders, dependent: :destroy
end
