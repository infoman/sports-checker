require 'rails_helper'

RSpec.describe Counter, type: :model do
  it { should have_many(:achievements) }
  it { should validate_presence_of(:name) }
end
