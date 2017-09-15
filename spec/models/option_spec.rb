require 'rails_helper'

RSpec.describe Option, "associations" do
  it { should belong_to :poll }
end

RSpec.describe Option, "validations" do
  it { should validate_presence_of :body }
end

RSpec.describe Option, ".add_vote" do
  it "successfully adds a vote to an option" do
    poll = FactoryGirl.create :poll
    option = poll.options.first

    expect{ Option.add_vote(option.id) }
      .to change{ option.reload.vote_count }.by 1
  end
end
