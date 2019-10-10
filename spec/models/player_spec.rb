require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:team).optional }
  it { should validate_presence_of :name }
end
