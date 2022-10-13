FactoryBot.define do
  factory :product do
    trait :icecream do
      name { 'Chocolate' }
      type { 'Icecream' }
      price { 50 }
    end

    trait :snackbar do
      name { 'Snickers' }
      type { 'Snackbar' }
      price { 50 }
    end

    trait :shaved_ice do
      name { 'Sherbet' }
      type { 'ShavedIce' }
      price { 50 }
    end
  end
end
