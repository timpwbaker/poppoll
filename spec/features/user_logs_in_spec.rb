require "rails_helper"

RSpec.feature "User manages session" do
  it "successfully logs in and logs out again" do
    user = FactoryGirl.create :user

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "Password"
    click_button "Sign in"

    expect(page).to have_content "Successfully signed in"

    click_link "Sign out"

    expect(page).to have_content "Signed out"
  end

  it "fails to log in due to invalid creds" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "goodbye@email.com"
    fill_in "Password", with: "Password"
    click_button "Sign in"

    expect(page).to have_content "Invalid username or password"
  end
end
