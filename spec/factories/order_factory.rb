FactoryBot.define do
  factory :order do
    trait :with_order_product do
      after(:build) do |order|
        order.order_products << FactoryBot.build(:order_product)
      end
    end
  end
end
