# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :image, presence: true
  has_one_attached :image
end
