
json.truck do @truck
  json.truck_id @truck.id
  json.profit @truck.profit


  json.icecreams @truck.products.icecreams do |icecream|
    json.flavour icecream.name
    json.in_stock @truck.truck_products.find_by(product: icecream).stock
  end

  json.snackbars @truck.products.snackbars do |snackbar|
    json.name snackbar.name
    json.in_stock @truck.truck_products.find_by(product: snackbar).stock
  end

  json.shaved_ice @truck.products.shaved_ices do |shaved_ice|
    json.name shaved_ice.name
    json.in_stock @truck.truck_products.find_by(product: shaved_ice).stock
  end
end
