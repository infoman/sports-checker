require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:players).dependent(:nullify) }
  it { should have_and_belong_to_many(:matches).inverse_of(:teams) }

  it { should validate_presence_of :name }
end
