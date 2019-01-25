require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:category) { Category.create(name: '1') }

  it "is valid with valid attributes" do
    expect(Project.new(category_id: category._id)).to be_valid
  end
end
