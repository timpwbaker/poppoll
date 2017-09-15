require "rails_helper"

RSpec.describe User, "validations" do
  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_presence_of :password}
  it {is_expected.to have_many :polls}
end

RSpec.describe User, ".guest" do
  it "should find an existing guest user" do
    user = FactoryGirl.create :user, :guest

    expect(User.guest).to eq user
  end

  it "should create a guest user if there isn't one" do
    expect(User.guest.name).to eq "Anonymous"
  end
end

RSpec.describe User, "#store_vote" do
  it "should store the vote against the user" do
    poll = FactoryGirl.create :poll
    user = FactoryGirl.create :user

    user.store_vote(poll.options.first)

    expect(user.votes).to eq({"#{poll.id}" => "#{poll.options.first.id}"})
  end
end

RSpec.describe User, "#voted?" do
  it "should return true if the user has voted" do
    poll = FactoryGirl.create :poll
    user = FactoryGirl.create :user, votes: {"#{poll.id}" => "#{poll.options.first.id}"}

    expect(user.voted?(poll)).to eq true
  end

end
