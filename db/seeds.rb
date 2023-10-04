# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product1 = Product.new(
  name: 'ベッド',
  description: '高級感のあるベット',
  price: 50_000,
  stock: 30
)
product1.image.attach(io: File.open('app/assets/images/bed.jpg'), filename: 'bed.jpg')
product1.save!

product2 = Product.new(
  name: '照明',
  description: 'シンプルなデザインの照明',
  price: 8000,
  stock: 30
)
product2.image.attach(io: File.open('app/assets/images/light.jpg'), filename: 'light.jpg')
product2.save!

product3 = Product.new(
  name: 'ソファ',
  description: 'レザーのソファ',
  price: 45_000,
  stock: 30
)
product3.image.attach(io: File.open('app/assets/images/sofa.jpg'), filename: 'sofa.jpg')
product3.save!

product4 = Product.new(
  name: 'カーテン',
  description: '部屋に馴染みやすい色味のカーテン',
  price: 10_000,
  stock: 30
)
product4.image.attach(io: File.open('app/assets/images/curtain.jpg'), filename: 'curtain.jpg')
product4.save!

product5 = Product.new(
  name: '食器棚',
  description: '収納されているものがよく見える食器棚',
  price: 35_000,
  stock: 30
)
product5.image.attach(io: File.open('app/assets/images/shelf.jpg'), filename: 'shelf.jpg')
product5.save!

product6 = Product.new(
  name: 'ダイニングテーブル',
  description: 'モダンなデザインのダイニングテーブル',
  price: 40_000,
  stock: 30
)
product6.image.attach(io: File.open('app/assets/images/table.jpg'), filename: 'table.jpg')
product6.save!

product7 = Product.new(
  name: 'プレート',
  description: '青の色味が綺麗なプレート',
  price: 1500,
  stock: 30
)
product7.image.attach(io: File.open('app/assets/images/dish.jpg'), filename: 'dish.jpg')
product7.save!

product8 = Product.new(
  name: 'マグカップ',
  description: 'シンプルなデザインのマグカップ',
  price: 1000,
  stock: 30
)
product8.image.attach(io: File.open('app/assets/images/magcup.jpg'), filename: 'magcup.jpg')
product8.save!
