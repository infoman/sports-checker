require 'rails_helper'

RSpec.describe MatchParticipant, type: :model do
  it { should belong_to(:match) }
  it { should belong_to(:team) }

  it { should validate_numericality_of(:score).only_integer }

  it { should delegate_method(:name).to(:team).with_prefix(true) }
end
