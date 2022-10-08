json.order do
  json.price_total @order.order_total
  json.items @order.products do |product|
    json.type product.type
    json.name product.name
    json.quantity @order.order_products.find_by(product_id: product).quantity
  end
  # json.profit @truck.profit

  # json.icecreams @truck.products.icecreams do |icecream|
  #   json.flavour icecream.name
  #   json.in_stock @truck.truck_products.find_by(product: icecream).stock
  # end

  # json.snackbars @truck.products.snackbars do |snackbar|
  #   json.name snackbar.name
  #   json.in_stock @truck.truck_products.find_by(product: snackbar).stock
  # end

  # json.shaved_ices @truck.products.shaved_ices do |shaved_ice|
  #   json.name shaved_ice.name
  #   json.in_stock @truck.truck_products.find_by(product: shaved_ice).stock
  # end
end
