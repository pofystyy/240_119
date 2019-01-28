require 'rails_helper'

RSpec.describe Education, type: :model do
  it "is valid with valid attributes" do
    expect(Education.new).to be_valid
  end

  # it "is valid with valid attributes" do
  #   expect(Education.new.active).to eq true
  # end

  it "is valid with valid attributes" do
    educ = Education.new(active: true)
    expect(educ.active).to eq true
  end

  it "is valid with valid attributes" do
    educ = Education.new(active: false)
    expect(educ.active).to eq false
  end

  it "is valid with valid attributes" do
    educ = Education.new(active: false)
    expect(educ.active).not_to eq true
  end
end
