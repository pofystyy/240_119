require 'rails_helper'

RSpec.describe Education, type: :model do
  it "is valid with valid attributes" do
    expect(Education.new).to be_valid
  end
end
