require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:players).dependent(:nullify) }
  it { should have_and_belong_to_many(:matches).inverse_of(:teams).dependent(:restrict_with_exception) }

  it { should validate_presence_of :name }

  describe "#top_players" do
    it "outputs top players for a specific achievement" do
      achievement = create :achievement, name: :made_goal, threshold: 1
      teams = create_list :team, 2
      players = create_list :player, 7, team: teams.first
      7.times do
        participants = teams.map do |team|
          build(:match_participant, match: nil, team: team, score: rand(5))
        end
        create :match, participants: participants
      end
      matches = Match.all

      # award achievement to players in a controllable way
      players.each_with_index do |player, i|
        matches.sample(i).each do |match|
          player.award_achievement(match, achievement)
        end
      end

      expect(teams.first.top_players(achievement).ids).to eq players.reverse.map(&:id).take(5)
    end
  end
end
