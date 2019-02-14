require 'rails_helper'

RSpec.describe Education, type: :model do
  it "is valid with valid attributes" do
    expect(Education.new(name: 'A', launch_date: 'Marth 18', description: 'something', requirements: 'qwerty', results: 'lorem', active: false)).to be_valid
  end

  it "is not valid with empty attributes" do
    expect(Education.new).not_to eq true
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
end
