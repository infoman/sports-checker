FactoryBot.define do
  factory :achievement do
    counter
    threshold { "9.99" }
    sequence(:name) {|n| "achievement #{n}" }
  end
end
