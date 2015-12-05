source "https://rubygems.org"
ruby "2.2.1"

gem "rails", "4.2.2"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "sdoc", "~> 0.4.0", group: :doc
gem "brewery_db"
gem "ember-cli-rails"
gem "jsonapi-resources"

group :development do
  gem "dotenv-rails"
end

group :development, :test do
  gem "pry"
  gem "rspec-rails"
  gem "web-console", "~> 2.0"
  gem "spring"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers", require: false
  gem "webmock"
  gem "climate_control"
end

group :staging, :production do
  gem "rails_12factor"
  gem "rails_stdout_logging"
end

gem 'rails_12factor', group: [:staging, :production]
