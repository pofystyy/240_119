require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it "is valid with valid attributes" do
    expect(Attachment.new).to be_valid
  end
end
