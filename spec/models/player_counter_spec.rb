require 'rails_helper'

RSpec.describe PlayerCounter, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:match) }
  it { should belong_to(:counter) }

  it { should validate_numericality_of(:value) }
  it { should delegate_method(:name).to(:player).with_prefix(true) }
  it { should delegate_method(:name).to(:counter).with_prefix(true) }
  it { should delegate_method(:unit).to(:counter).with_prefix(true) }

  describe "after_save achievements check" do
    before :each do
      @counter = create :player_counter, value: 0
      create :achievement, counter: @counter.counter, threshold: 1.11
      @player = @counter.player
    end

    it "awards an achievement if value is above threshold" do
      expect {
        @counter.update_attribute :value, 2
      }.to change {
        @player.achievements.count
      }.by 1
    end

    it "awards an achievement if value is exactly at threshold" do
      expect {
        @counter.update_attribute :value, 1.11
      }.to change {
        @player.achievements.count
      }.by 1
    end

    it "does not award achievements if value is below threshold" do
      expect {
        @counter.update_attribute :value, 1
      }.to_not change {
        @player.achievements.count
      }
    end
  end
end
