FactoryBot.define do
  factory :match do
    sequence(:location) {|n| "Arena #{n}"}
    participants { build_list :match_participant, 2, match: nil }
  end
end
