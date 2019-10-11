FactoryBot.define do
  factory :counter do
    sequence(:name) {|n| "Counter #{n}" }
    unit { "km" }
  end
end
