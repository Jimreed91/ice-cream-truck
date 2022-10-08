json.order do
  json.price_total @order.order_total
  json.items @order.products do |product|
    json.type product.type
    json.name product.name
    json.quantity @order.order_products.find_by(product_id: product).quantity

  end
