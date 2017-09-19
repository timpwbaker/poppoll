## POPpoll
Pop poll is a simple rails app for running multiple choice polls. Users can
create polls with as many options as they want, then other users can vote. Poll
views are updated in real time using ActionCable.

Hosted on heroku here:
http://pop-poll.herokuapp.com/

# Setup
The application uses rails 5.1 and a postgres db.

Postgres installation guides can be found here:
https://wiki.postgresql.org/wiki/Detailed_installation_guides

The application uses ActionCable for updating the results of polls in real time,
this requires Redis, on homebrew or equivalent:

   brew install redis

Run the following commands to set up and start the application:

    bundle install
    bundle exec rails db:test:prepare
    bundle exec rails db:migrate
    bundle exec rails db:test:prepare
    rails s

visit localhost:3000

# Tests
Tests are Capybara and RSpec making use of the chrome headless browser.

Install chromedriver if you haven't, on homebrew:

    brew install chromedriver

Run the tests as follows:

    rspec

