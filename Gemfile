source "https://rubygems.org"

gem "rails", "4.2.2"
gem "sqlite3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "sdoc", "~> 0.4.0", group: :doc
gem "brewery_db"

group :development do
  gem "dotenv-rails"
end

group :development, :test do
  gem "pry"
  gem "web-console", "~> 2.0"
  gem "spring"
end

group :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem "shoulda-matchers", require: false
  gem "webmock"
end

group :staging, :production do
  gem "rails_12factor"
  gem "rails_stdout_logging"
end
