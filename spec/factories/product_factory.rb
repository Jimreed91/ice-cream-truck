FactoryBot.define do

  factory :product do

    trait :icecream do
      name {"Chocolate"}
      type {"Icecream"}
      price {1.99}
    end

    trait :snackbar do
      name {"Snickers"}
      type {"Snackbar"}
      price {0.45}
    end

    trait :shaved_ice do
      name {"Sherbet"}
      type {"ShavedIce"}
      price {1}
    end
  end
end
