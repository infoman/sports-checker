require 'rails_helper'

RSpec.describe PlayerCounter, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:match) }
  it { should belong_to(:counter) }

  it { should validate_numericality_of(:value) }
  it { should delegate_method(:name).to(:player).with_prefix(true) }
  it { should delegate_method(:name).to(:counter).with_prefix(true) }
  it { should delegate_method(:unit).to(:counter).with_prefix(true) }
end
