require 'rails_helper'

RSpec.describe PlayerAchievement, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:match) }
  it { should belong_to(:achievement) }

  it { should delegate_method(:name).to(:player).with_prefix(true) }
  it { should delegate_method(:name).to(:achievement).with_prefix(true) }
end
