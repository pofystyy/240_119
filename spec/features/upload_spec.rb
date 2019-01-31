require "rails_helper"
require 'json'

RSpec.describe "Upload Controller", type: :feature do
  let(:valid_upload)   { attributes_for(:upload) }
  let(:invalid_upload) { build(:upload) }

  before(:each) do
    DatabaseCleaner.clean
    #create_list(:upload, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit uploads_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      test_upload = Upload.create([valid_upload])
      visit uploads_path

      expect(page).to have_content(UploadSerializer.new(test_upload).serialized_json)
    end

    scenario "should not return json" do
      visit uploads_path

      expect(page).not_to have_content(UploadSerializer.new([invalid_upload]).serialized_json)
    end
  end
end
