require "rails_helper"

RSpec.feature "User manages account" do
  it "successfully logs in" do
    user = FactoryGirl.create :user

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "Password"
    click_button "Sign in"

    expect(page).to have_content "Successfully signed in"
  end
end
