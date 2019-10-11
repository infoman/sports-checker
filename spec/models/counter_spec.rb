require 'rails_helper'

RSpec.describe Counter, type: :model do
  subject { create :counter }

  it { should have_many(:achievements) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
