require 'rails_helper'

RSpec.describe Career, type: :model do
  it "is valid with valid attributes" do
    expect(Career.new).to be_valid
  end
end
