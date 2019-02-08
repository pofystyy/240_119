require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before(:each) do
    DatabaseCleaner.clean
  end

  it "is valid with valid attributes" do
    expect(User.new).to be_valid
  end

  it "returns the correct number of users" do
    user
    expect(User.count).to eq 1
  end

  it "returns the correct number of users" do
    create_list(:user, 5)
    expect(User.count).to eq 5
  end
end
