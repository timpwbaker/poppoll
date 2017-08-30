require "rails_helper"

RSpec.describe User, "validations" do
  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_presence_of :password}
  it {is_expected.to have_many :polls}
end
