# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([
                            { price: 0.50, type: 'Icecream', name: 'Pistachio' },
                            { price: 0.50, type: 'Icecream', name: 'Chocolate' },
                            { price: 0.50, type: 'Icecream', name: 'Mint' },
                            { price: 0.50, type: 'Icecream', name: 'Strawberry' },
                            { price: 0.50, type: 'Snackbar', name: 'Twix' },
                            { price: 0.50, type: 'Snackbar', name: 'Kitkat' },
                            { price: 0.50, type: 'ShavedIce', name: 'Peach' }
                          ])

first_truck = Truck.create

products.each do |product|
  if product.type == 'Icecream' || product.type == 'Snackbar'
    TruckProduct.create(product: product, truck: first_truck, start_quantity: 30)
  else
    TruckProduct.create(product: product, truck: first_truck, start_quantity: 15)
  end
end
