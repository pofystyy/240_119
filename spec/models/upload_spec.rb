require 'rails_helper'

RSpec.describe Upload, type: :model do
  it "is valid with valid attributes" do
    expect(Upload.new).to be_valid
  end
end
