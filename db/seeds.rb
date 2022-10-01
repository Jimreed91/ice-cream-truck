# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([
  { price: 0.50, start_quantity: 5, product_type: :icecream, name: "Pistachio" },
  { price: 0.50, start_quantity: 5, product_type: :icecream, name: "Chocolate" },
  { price: 0.50, start_quantity: 5, product_type: :icecream, name: "Mint" },
  { price: 0.50, start_quantity: 5, product_type: :icecream, name: "Strawberry" },
  { price: 0.50, start_quantity: 2, product_type: :snackbar, name: "Twix" },
  { price: 0.50, start_quantity: 2, product_type: :snackbar, name: "Kitkat" },
  { price: 0.50, start_quantity: 5, product_type: :shaved_ice, name: "Peach" }
])

first_truck = Truck.create()

first_truck.products << products
