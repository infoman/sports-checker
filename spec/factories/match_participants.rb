FactoryBot.define do
  factory :match_participant do
    match
    team
    score { 1 }
  end
end
