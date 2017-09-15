require "rails_helper"

RSpec.feature "User votes in a poll" do
  context "guest user" do
    it "successfully registers vote as guest" do
      poll = FactoryGirl.create :poll

      visit poll_path(poll)
      click_button "Option 2"

      expect(page).to have_content "Successfully voted"
      expect(page).to have_content "You have voted in this poll"
    end
  end

  context "logged in user" do
    it "successfully registers vote while logged in" do
      poll = FactoryGirl.create :poll
      user = FactoryGirl.create :user

      log_in user
      visit poll_path(poll)
      click_button "Option 2"

      expect(page).to have_content "Successfully voted"
      expect(page).to have_content "You have voted in this poll"
    end
  end
end
