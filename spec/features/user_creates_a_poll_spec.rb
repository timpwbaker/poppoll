require "rails_helper"

RSpec.feature "User creates a poll" do
  scenario "As a guest user from the homepage", js: true do
    visit root_path

    fill_in "Question", with: "What I really want to know"
    all('.option-body-field').first.set("Option")
    all('.option-body-field').last.set("Option")
    3.times {
      all('.option-body-field').last.set("Option")
      click_link "Add option"
    }
    all('.option-body-field').last.set("Option")
    click_button "Create poll"

    expect(page).to have_content "Poll created"
    expect(page).to have_content "What I really want to know"
    expect(page).to have_content "Option"
  end

  scenario "As a guest user from the new poll page", js: true do
    visit new_poll_path

    fill_in "Question", with: "What I really want to know"
    all('.option-body-field').first.set("Option")
    all('.option-body-field').last.set("Option")
    3.times {
      all('.option-body-field').last.set("Option")
      click_link "Add option"
    }
    all('.option-body-field').last.set("Option")
    click_button "Create poll"

    expect(page).to have_content "Poll created"
    expect(page).to have_content "What I really want to know"
    expect(page).to have_content "Option"
  end

  scenario "fails to create the poll" do
    visit new_poll_path

    fill_in "Question", with: "What I really want to know"
    click_button "Create poll"

    expect(page).to have_content "Options body can't be blank"
  end
end
