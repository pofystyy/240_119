require "rails_helper"

RSpec.describe "Work Controller", type: :feature do
  let(:valid_work)   { create(:work) }
  let(:invalid_work) { build(:work) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:work, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit works_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_work
      visit works_path

      resp = WorkSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit works_path

      resp = WorkSerializer.new(invalid_work).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit work_path(id: Work.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_work
      visit work_path(id: object.id.to_s)

      resp = WorkSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
