FactoryBot.define do
  factory :truck do
    trait :with_truck_products do
      after(:build) do |truck|
        truck.truck_products << FactoryBot.build(:truck_product, :with_icecream)
        truck.truck_products << FactoryBot.build(:truck_product, :with_snackbar)
        truck.truck_products << FactoryBot.build(:truck_product, :with_shaved_ice)
      end
    end
  end
end
