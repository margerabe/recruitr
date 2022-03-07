require 'rails_helper'

RSpec.describe Candidate, type: :model do
  before(:all) do
    @candidate = create(:candidate)
  end
  
  it { should belong_to(:position) }

  it "is valid with valid attributes" do
    expect(@candidate).to be_valid
  end
end
