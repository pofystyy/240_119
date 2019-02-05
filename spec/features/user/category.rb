require "rails_helper"

RSpec.describe "Category Controller", type: :feature do
  let(:valid_category)   { create(:category_with_project) }
  let(:invalid_category) { build(:category_with_project) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:category_with_project, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit categories_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_category
      visit categories_path

      resp = CategorySerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit categories_path

      resp = CategorySerializer.new(invalid_category).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit category_path(id: Category.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_category
      visit category_path(id: object.id.to_s)

      resp = CategorySerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end
  end
end
