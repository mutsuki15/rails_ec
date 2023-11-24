# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :address1, null: false
      t.string :address2
      t.integer :billing_amount, null: false
      t.references :customer, null: false, foreign_key: true
      t.references :credit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
