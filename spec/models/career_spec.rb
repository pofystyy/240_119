require 'rails_helper'

RSpec.describe Career, type: :model do
  it "is valid with valid attributes" do
    expect(Career.new).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Career.new.active).to eq true
  end

  it "is valid with valid attributes" do
    career = Career.new(active: true)
    expect(career.active).to eq true
  end

  it "is valid with valid attributes" do
    career = Career.new(active: false)
    expect(career.active).to eq false
  end

  it "is valid with valid attributes" do
    career = Career.new(active: false)
    expect(career.active).not_to eq true
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

  it "is valid Serialization" do
    career = Career.new
    expect(CareerSerializer.new(career).serializable_hash).to eq({ data: { attributes: { name: nil,
                                                                                         description: nil,
                                                                                         requirements: nil,
                                                                                         benefits: nil,
                                                                                         active: true },
                                                                           id: career.id.to_s,
                                                                           type: :career } })
  end

  it "is not valid Serialization" do
    career = Career.new(name: 'B', description: 'something_else')
    expect(CareerSerializer.new(career).serializable_hash).not_to eq({ data: { attributes: { name: 'A',
                                                                                             description: 'something',
                                                                                             requirements: 'qwerty',
                                                                                             benefits: 'lorem',
                                                                                             active: false },
                                                                               id: career.id.to_s,
                                                                               type: :career } })
  end
end
