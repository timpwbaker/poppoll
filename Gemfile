source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.3'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.6.0'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
