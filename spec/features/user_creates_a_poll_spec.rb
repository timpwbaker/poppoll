require "rails_helper"

RSpec.feature "User creates a poll" do
  scenario "As a guest user from the homepage", js: true do
    visit root_path

    fill_in "Question", with: "What I really want to know"
    3.times {
      all('.option-body-field').last.set("Option")
      click_link "add option"
    }
    all('.option-body-field').last.set("Option")
    click_button "Create poll"

    expect(page).to have_content "Poll created"
    expect(page).to have_content "What I really want to know"
    expect(page).to have_content "Option"
  end

  scenario
end
