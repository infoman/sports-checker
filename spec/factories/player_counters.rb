FactoryBot.define do
  factory :player_counter do
    player
    match
    counter
    value { "9.99" }
  end
end
