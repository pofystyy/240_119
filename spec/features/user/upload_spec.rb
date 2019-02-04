require "rails_helper"
require 'json'

RSpec.describe "Upload Controller", type: :feature do
  let(:valid_upload)   { create(:upload) }
  let(:invalid_upload) { build(:upload) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:upload, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit uploads_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_upload
      visit uploads_path

      resp = UploadSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit uploads_path

      resp = UploadSerializer.new(invalid_upload).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit upload_path(id: Upload.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_upload
      visit upload_path(id: object.id.to_s)

      resp = UploadSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
