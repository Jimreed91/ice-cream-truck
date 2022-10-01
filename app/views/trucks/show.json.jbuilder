
json.truck do @truck
  json.truck_id @truck.id
  json.profit @truck.profit
end

json.icecreams @truck.truck_products do |truck_p|
  json.name truck_p.product.name
  # json.in_stock truck_p.stock
end
