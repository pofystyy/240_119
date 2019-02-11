require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    DatabaseCleaner.clean
    create_list(:user, 5)
  end

  it "is valid with valid attributes" do
    expect(User.new).to be_valid
  end

  it "is valid with valid attributes" do
    expect(User.count).to eq 5
  end

  it "is valid with valid attributes" do
    User.create(email: 'as@as', password: '123')
    expect(User.count).to eq 6
  end
end
