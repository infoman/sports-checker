require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:team).optional }
  it { should have_many(:counters).class_name('PlayerCounter') }
  it { should have_many(:achievements).class_name('PlayerAchievement') }
  it { should validate_presence_of :name }
end
