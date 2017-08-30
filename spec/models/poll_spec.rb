require 'rails_helper'

RSpec.describe Poll, "validations" do
  it {is_expected.to validate_presence_of :question}
  it {is_expected.to belong_to :user}
end
