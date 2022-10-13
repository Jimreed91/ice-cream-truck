json.total_profit Truck.all_trucks_profit
json.trucks @trucks.each do |truck|
  json.truck truck
end
