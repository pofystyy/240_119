require 'rails_helper'

RSpec.describe Career, type: :model do
  it "is valid with valid attributes" do
    expect(Career.new(name: 'A', description: 'something', requirements: 'qwerty', benefits: 'lorem', active: false)).to be_valid
  end

  it "is not valid with empty attributes" do
    expect(Career.new).not_to eq true
  end

  it "is valid Serialization" do
    career = Career.new(name: 'A', description: 'something', requirements: 'qwerty', benefits: 'lorem', active: false)
    expect(CareerSerializer.new(career).serializable_hash).to eq({ data: { attributes: { name: 'A',
                                                                                         description: 'something',
                                                                                         requirements: 'qwerty',
                                                                                         benefits: 'lorem',
                                                                                         active: false },
                                                                           id: career.id.to_s,
                                                                           type: :career } })
  end
end
