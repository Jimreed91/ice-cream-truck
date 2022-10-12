FactoryBot.define do
  factory :product do
    trait :icecream do
      name { 'Chocolate' }
      type { 'Icecream' }
      price { 199 }
    end

    trait :snackbar do
      name { 'Snickers' }
      type { 'Snackbar' }
      price { 45 }
    end

    trait :shaved_ice do
      name { 'Sherbet' }
      type { 'ShavedIce' }
      price { 100 }
    end
  end
end
