require "rails_helper"

RSpec.describe "Attachment Controller", type: :feature do
  let(:valid_attachment)   { create(:attachment) }
  let(:invalid_attachment) { build(:attachment) }

  before(:each) do
    DatabaseCleaner.clean
    create_list(:attachment, 5)
  end

  context "GET index" do
    scenario "status should be 200" do
      visit attachments_path

      expect(page).to have_http_status(200)
    end

    scenario "should return json" do
      object = valid_attachment
      visit attachments_path

      resp = AttachmentSerializer.new(object).serialized_json
      expect(page).to have_content(resp[8..-2])
    end

    scenario "should not return json" do
      visit attachments_path

      resp = AttachmentSerializer.new(invalid_attachment).serialized_json
      expect(page).not_to have_content(resp[8..-2])
    end
  end

  context "GET show" do
    scenario "status should be 200" do
      visit attachment_path(id: Attachment.last.id.to_s)

      expect(page).to have_http_status(200)
    end

    scenario "should return object with selected id" do
      object = valid_attachment
      visit attachment_path(id: object.id.to_s)

      resp = AttachmentSerializer.new(object).serialized_json
      expect(page).to have_content(resp)
    end
  end
end
