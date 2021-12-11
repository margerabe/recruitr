require 'rails_helper'

RSpec.describe Position, type: :model do
  before(:all) do
    @position1 = create(:position)
  end
  
  it { should have_many(:candidates) }

  it "is valid with valid attributes" do
    expect(@position1).to be_valid
  end

  it "cannot have a blank title attribute" do
    position2 = build(:position, title: nil)
    expect(position2).to_not be_valid
  end

  # describe 'associations' do
  #   it { should have_many(:candidates) }
  # end
end
