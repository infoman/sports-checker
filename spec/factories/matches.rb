FactoryBot.define do
  factory :match do
    sequence(:location) {|n| "Arena #{n}"}
  end
end
