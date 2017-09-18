require "rails_helper"

RSpec.feature "User searches for a spec" do
  scenario "and finds what they're looking for" do
    FactoryGirl.create :poll, question: "This one should be easy to find"

    visit root_path
    fill_in "query", with: "easy to find"
    click_button "Search"

    expect(page).to have_content "1 Result"
    expect(page).to have_content "This one should be easy to find"
  end
end
