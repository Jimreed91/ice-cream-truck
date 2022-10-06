FactoryBot.define do
  factory :truck_product do
    start_quantity {10}
    sold {0}

    trait :with_icecream do
      after(:build) do |truck_product|
        truck_product.product = FactoryBot.build(:product, :icecream)
      end
    end

    trait :with_snackbar do
      after(:build) do |truck_product|
        truck_product.product = FactoryBot.build(:product, :snackbar)
      end
    end

    trait :with_shaved_ice do
      after(:build) do |truck_product|
        truck_product.product = FactoryBot.build(:product, :shaved_ice)
      end
    end
  end
end
