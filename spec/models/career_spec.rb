require 'rails_helper'

RSpec.describe Career, type: :model do
  it "is valid with valid attributes" do
    expect(Career.new).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Career.new.active).to eq true
  end

  it "is valid with valid attributes" do
    career = Career.new(active: true)
    expect(career.active).to eq true
  end

  it "is valid with valid attributes" do
    career = Career.new(active: false)
    expect(career.active).to eq false
  end

  it "is valid with valid attributes" do
    career = Career.new(active: false)
    expect(career.active).not_to eq true
  end
end
