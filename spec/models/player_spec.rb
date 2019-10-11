require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:team).optional }
  it { should have_many(:counters).class_name('PlayerCounter').dependent(:destroy) }
  it { should have_many(:achievements).class_name('PlayerAchievement').dependent(:destroy) }
  it { should validate_presence_of :name }

  describe "properly sets counters and achievements" do
    before :each do
      @counter = create :counter
      @achievement = create :achievement, counter: @counter, threshold: 2
      @match = create :match
      @player = create :player, team: @match.teams.first
    end

    describe "#set_counter" do
      it "creates a counter record when no on exists yet" do
        expect {
          @player.set_counter(@match, @counter, 1)
        }.to change {
          @player.counters.count
        }.by 1
      end

      it "sets a counter to specific value" do
        @player.set_counter(@match, @counter, 1)

        expect {
          @player.set_counter(@match, @counter, 0.5)
        }.to change {
          @player.counters.find_by_counter_id(@counter.id).value
        }.to 0.5
      end

      it "accepts numeric ids to matches and counters" do
        expect(@player.set_counter(@match.id, @counter.id, 1)).to be_a PlayerCounter
      end

      it "accepts string ids to counters" do
        expect(@player.set_counter(@match, @counter.name, 1)).to be_a PlayerCounter
      end

      it "accepts symbol ids to counters" do
        expect(@player.set_counter(@match, @counter.name.to_sym, 1)).to be_a PlayerCounter
      end

      context "for players outside of participating teams" do
        before :each do
          @other_player = create :player
        end

        it "fails if player is not a team member" do
          expect { @other_player.set_counter(@match, @counter, 1) }.to raise_error(RuntimeError)
        end

        it "accepts changes with force = true" do
          expect { @other_player.set_counter(@match, @counter, 1, force: true) }.to_not raise_error
        end
      end
    end

    describe "#award_achievement" do
      it "creates an achievement record when no one exists yet" do
        expect {
          @player.award_achievement(@match, @achievement)
        }.to change {
          @player.achievements.count
        }.by 1
      end

      it "accepts numeric ids to matches and achievements" do
        expect(@player.award_achievement(@match.id, @achievement.id)).to be_a PlayerAchievement
      end

      it "accepts string ids to achievements" do
        expect(@player.award_achievement(@match, @achievement.name)).to be_a PlayerAchievement
      end

      it "accepts symbol ids to achievements" do
        expect(@player.award_achievement(@match, @achievement.name.to_sym)).to be_a PlayerAchievement
      end

      context "for players outside of participating teams" do
        before :each do
          @other_player = create :player
        end

        it "fails if player is not a team member" do
          expect { @other_player.award_achievement(@match, @achievement) }.to raise_error(RuntimeError)
        end

        it "accepts changes with force = true" do
          expect { @other_player.award_achievement(@match, @achievement, force: true) }.to_not raise_error
        end
      end
    end
  end
end
