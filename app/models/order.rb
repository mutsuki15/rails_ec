# frozen_string_literal: true

class Order < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :address1, presence: true
  belongs_to :customer
  belongs_to :credit
  has_many :order_details, dependent: :destroy
end
