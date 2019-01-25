require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:category)     { Category.new('1') }
  it "is valid with valid attributes" do
    expect(Project.new(category: '1')).to be_valid
  end
end
