# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, &:timestamps
  end
end
