require 'rails_helper'

RSpec.describe Upload, type: :model do
  it "is valid with valid attributes" do
    expect(Upload.new).to be_valid
  end

  it "is valid Serialization" do
    upload = Upload.new(url_data: 'url')
    expect(UploadSerializer.new(upload).serializable_hash).to eq({ data: { attributes: { url_data: 'url' },
                                                                           id: upload.id.to_s,
                                                                           type: :upload } })
  end

  it "is valid Serialization" do
    upload = Upload.new
    expect(UploadSerializer.new(upload).serializable_hash).to eq({ data: { attributes: { url_data: nil },
                                                                           id: upload.id.to_s,
                                                                           type: :upload } })
  end

  it "is not valid Serialization" do
    upload = Upload.new(url_data: 'url')
    expect(UploadSerializer.new(upload).serializable_hash).not_to eq({ data: { attributes: { url_data: 'data' },
                                                                               id: upload.id.to_s,
                                                                               type: :upload } })
  end
end
