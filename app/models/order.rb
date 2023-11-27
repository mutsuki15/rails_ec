# frozen_string_literal: true

class Order < ApplicationRecord
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :user_name
    validates :email
    validates :postal_code
    validates :prefecture
    validates :address1
  end
  belongs_to :customer
  belongs_to :credit
  has_many :order_details, dependent: :destroy
end
