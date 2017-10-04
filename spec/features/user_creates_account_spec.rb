require 'rails_helper'

RSpec.feature "User creates an account" do
  it "successfully creates an account" do
    visit new_user_path
    fill_in "Name", with: "Tom Jones"
    fill_in "Email", with: "tomjones@hotmail.co.uk"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"
    click_button 'Submit'

    expect(page).to have_content "Account created"
  end

  it "fails to create an account" do
    visit new_user_path
    click_button 'Submit'

    expect(page).to have_content "Password can't be blank "
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
  end
end
