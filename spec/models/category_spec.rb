require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with valid attributes" do
    expect(Category.new).to be_valid
  end

  it "is valid Serialization" do
    category = Category.new(name: '1')
    expect(CategorySerializer.new(category).serializable_hash).to eq({ data: { attributes: { name: '1' },
                                                                               id: category.id.to_s,
                                                                               relationships: { projects: { data: [] }},
                                                                               type: :category} })
  end

  it "is valid Serialization" do
    category = Category.new
    expect(CategorySerializer.new(category).serializable_hash).to eq({ data: { attributes: { name: nil },
                                                                               id: category.id.to_s,
                                                                               relationships: { projects: { data: [] }},
                                                                               type: :category} })
  end

  it "is not valid Serialization" do
    category = Category.new(name: '1')
    expect(CategorySerializer.new(category).serializable_hash).not_to eq({ data: { attributes: { name: '2' },
                                                                                   id: category.id.to_s,
                                                                                   relationships: { projects: { data: [] }},
                                                                                   type: :category} })
  end
end
