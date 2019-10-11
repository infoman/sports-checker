FactoryBot.define do
  factory :achievement do
    counter
    threshold { "1.11" }
    sequence(:name) {|n| "achievement #{n}" }
  end
end
