require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_many(:participants) }
  it { should have_many(:teams).through(:participants) }

  it { should validate_presence_of(:location) }

  # TODO: wait for a fix to thoughtbot/shoulda-matchers#1007
  # it { should validate_length_of(:participants).is_equal_to(2) }
  describe "validates that a match has 2 participants" do
    before :each do
      @match = build :match
    end

    it "should not accept empty matches" do
      expect(@match).to_not be_valid
    end

    it "should not accept matches with only 1 team playing" do
      @match.participants << build_list(:match_participant, 1)
      expect(@match).to_not be_valid
    end

    it "should accept matches with 2 teams playing" do
      @match.participants << build_list(:match_participant, 2)
      expect(@match).to be_valid
    end

    it "should not accept matches with more than 2 teams" do
      @match.participants << build_list(:match_participant, 3)
      expect(@match).to_not be_valid
    end
  end
end
