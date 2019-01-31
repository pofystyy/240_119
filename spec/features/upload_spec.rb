require "rails_helper"
require 'json'

RSpec.describe "Upload Controller", type: :feature do
  #let(:upload) { create(:upload) }

   context "GET index" do
  #   scenario "should return json" do
  #     visit uploads_path
  #     data = UploadSerializer.new(upload).serialized_json
  #     expect(page).to have_content(data)
  #   end

    scenario "status should be 200" do
      visit uploads_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      upload = { url_data: 'url' }.to_json
      visit uploads_path

      expect(page).to have_content(upload)
    end

    scenario "should not return json" do
      project = { first: 'field', second: 'url' }.to_json
      visit uploads_path

      expect(page).not_to have_content(project)
    end
  end
end
