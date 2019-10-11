require 'rails_helper'

RSpec.describe Achievement, type: :model do
  subject { create :achievement }

  it { should belong_to(:counter) }
  it { should validate_numericality_of(:threshold) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
