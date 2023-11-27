# frozen_string_literal: true

class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.string :name, null: false
      t.string :number, null: false
      t.string :expiration, null: false
      t.string :cvv, null: false

      t.timestamps
    end
  end
end
