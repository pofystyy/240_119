require "rails_helper"

RSpec.describe "Education Controller", type: :feature do
  let(:valid_education)   { create(:education) }
  let(:invalid_education) { build(:education) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:education, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit educations_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_education
      visit educations_path

      resp = EducationSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit educations_path

      resp = EducationSerializer.new(invalid_education).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit education_path(id: Education.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_education
      visit education_path(id: object.id.to_s)

      resp = EducationSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
