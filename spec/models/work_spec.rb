require 'rails_helper'

RSpec.describe Work, type: :model do
  it "is valid with valid attributes" do
    expect(Work.new(year: 2018, description: 'work')).to be_valid
  end

  it "is not valid with empty attributes" do
    expect(Work.new).not_to be_valid
  end

  it "is valid Serialization" do
    work = Work.new(year: 2018, description: 'work')
    expect(WorkSerializer.new(work).serializable_hash).to eq({ data: { attributes: { description: 'work', year: 2018 },
                                                                       id: work.id.to_s,
                                                                       type: :work } })
  end
end
