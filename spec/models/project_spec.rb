require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:category) { Category.create(name: '1') }

  it "is valid with valid attributes" do
    expect(Project.new(category_id: category._id)).to be_valid
  end

  it "is valid Serialization" do
    project = Project.new(name: 'A', url: 'url', description: 'first', content: 'qwerty', category_id: category.id)
    expect(ProjectSerializer.new(project).serializable_hash).to eq( data: { attributes: { content: "qwerty",
                                                                                          description: "first",
                                                                                          name: "A",
                                                                                          url: "url"},
                                                                            id: project.id.to_s,
                                                                            relationships: { category: { data: { id: category.id.to_s,
                                                                                                                 type: :category}}},
                                                                            type: :project})
  end

  it "is not valid Serialization" do
    project = Project.new(name: 'B', url: 'http', description: 'first', content: nil, category_id: category.id)
    expect(ProjectSerializer.new(project).serializable_hash).not_to eq( data: { attributes: { content: "qwerty",
                                                                                              description: "first",
                                                                                              name: "A",
                                                                                              url: "url"},
                                                                                id: project.id.to_s,
                                                                                relationships: { category: { data: { id: category.id.to_s,
                                                                                                                     type: :category}}},
                                                                                type: :project})
  end
end
