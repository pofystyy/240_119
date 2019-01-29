require 'rails_helper'

RSpec.describe Work, type: :model do
  it "is valid with valid attributes" do
    expect(Work.new).to be_valid
  end

  it "is valid Serialization" do
    work = Work.new(year: 2018)
    expect(WorkSerializer.new(work).serializable_hash).to eq({ data: { attributes: { description: nil, year: 2018 },
                                                                       id: work.id.to_s,
                                                                       type: :work } })
  end

  it "is valid Serialization" do
    work = Work.new(year: 2018, description: 'work')
    expect(WorkSerializer.new(work).serializable_hash).to eq({ data: { attributes: { description: 'work', year: 2018 },
                                                                       id: work.id.to_s,
                                                                       type: :work } })
  end

  it "is valid Serialization" do
    work = Work.new
    expect(WorkSerializer.new(work).serializable_hash).to eq({ data: { attributes: { description: nil, year: nil },
                                                                       id: work.id.to_s,
                                                                       type: :work } })
  end

  it "is not valid Serialization" do
    work = Work.new(year: 2017, description: 'works')
    expect(WorkSerializer.new(work).serializable_hash).not_to eq({ data: { attributes: { description: 'job', year: 1999 },
                                                                           id: work.id.to_s,
                                                                           type: :work } })
  end
end
