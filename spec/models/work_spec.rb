require 'rails_helper'

RSpec.describe Work, type: :model do
  it "is valid with valid attributes" do
    expect(Work.new).to be_valid
  end
end
