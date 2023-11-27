# frozen_string_literal: true

class Credit < ApplicationRecord
  validates :name, presence: true
  validates :number, presence: true
  validates :expiration, presence: true
  validates :cvv, presence: true
  has_one :order, dependent: :destroy
end
