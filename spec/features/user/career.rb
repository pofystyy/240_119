require "rails_helper"
require 'json'

RSpec.describe "Career Controller", type: :feature do
  let(:valid_career)   { create(:career) }
  let(:invalid_career) { build(:career) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:career, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit careers_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_career
      visit careers_path

      resp = CareerSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit careers_path

      resp = CareerSerializer.new(invalid_career).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit career_path(id: Career.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_career
      visit career_path(id: object.id.to_s)

      resp = CareerSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
