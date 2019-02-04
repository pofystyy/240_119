require 'rails_helper'

RSpec.describe Education, type: :model do
  it "is valid with valid attributes" do
    expect(Education.new).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Education.new.active).to eq true
  end

  it "is valid with valid attributes" do
    education = Education.new(active: true)
    expect(education.active).to eq true
  end

  it "is valid with valid attributes" do
    education = Education.new(active: false)
    expect(education.active).to eq false
  end

  it "is valid with valid attributes" do
    education = Education.new(active: false)
    expect(education.active).not_to eq true
  end

  it "is valid Serialization" do
    education = Education.new(name: 'A', launch_date: 'Marth 18', description: 'something', requirements: 'qwerty', results: 'lorem', active: false)
    expect(EducationSerializer.new(education).serializable_hash).to eq({ data: { attributes: { name: 'A',
                                                                                               description: 'something',
                                                                                               launch_date: 'Marth 18',
                                                                                               requirements: 'qwerty',
                                                                                               results: 'lorem',
                                                                                               active: false },
                                                                                 id: education.id.to_s,
                                                                                 type: :education } })
  end

  it "is valid Serialization" do
    education = Education.new
    expect(EducationSerializer.new(education).serializable_hash).to eq({ data: { attributes: { name: nil,
                                                                                               description: nil,
                                                                                               launch_date: nil,
                                                                                               requirements: nil,
                                                                                               results: nil,
                                                                                               active: true },
                                                                                 id: education.id.to_s,
                                                                                 type: :education } })
  end

  it "is not valid Serialization" do
    education = Education.new(name: 'B', description: 'something_else')
    expect(EducationSerializer.new(education).serializable_hash).not_to eq({ data: { attributes: { name: 'A',
                                                                                                   description: 'something',
                                                                                                   requirements: 'qwerty',
                                                                                                   results: 'lorem',
                                                                                                   active: false },
                                                                                     id: education.id.to_s,
                                                                                     type: :education } })
  end
end
