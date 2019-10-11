require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should belong_to(:counter) }
  it { should validate_numericality_of(:threshold) }
  it { should validate_presence_of(:name) }
end
