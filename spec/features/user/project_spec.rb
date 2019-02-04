require "rails_helper"
require 'json'

RSpec.describe "Project Controller", type: :feature do
  let(:category)        { create(:category) }
  let(:valid_project)   { create(:project) }
  let(:invalid_project) { build(:project) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:project, 5)
  end

   context "GET index" do
    scenario "status should be 200" do
      visit projects_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_project
      visit projects_path

      resp = ProjectSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should return json selected category" do
      object = create_list(:project, 2, category_id: category.id)

      visit projects_path(category: category.id.to_s)

      resp = ProjectSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end

    scenario "should not return json" do
      visit projects_path

      resp = ProjectSerializer.new(invalid_project).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit project_path(id: Project.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_project
      visit project_path(id: object.id.to_s)

      resp = ProjectSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
