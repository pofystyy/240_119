require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    DatabaseCleaner.clean
    create_list(:user, 5)
  end

  context "is not valid" do
    it "is not valid with empty attributes" do
      expect(User.new).not_to be_valid
    end

    it "is not valid with not valid attributes" do
      expect(User.create(email: 'r@r.qw', password: '123')).not_to be_valid
    end

  # it "is not valid without password_confirmation" do
  #   User.create(email: 'user_first@mail.com', password: 'Qwerty123', )
  #   expect(User.count).not_to eq 6
  # end
  end

  context "is valid" do
    it "is valid with valid attributes" do
      expect(User.count).to eq 5
    end

     it "is valid with valid attributes" do
      User.create(email: 'user_first@mail.com', password: 'Qwerty123')#, password_confirmation: 'Qwerty123' )
      expect(User.count).to eq 6
    end
  end
end
