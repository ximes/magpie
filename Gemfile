# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.21.0"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem "rails", "~> 5.1.2"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# For url validation
gem "validate_url", "~> 1.0.2"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 3.5"
end
group :test do
  gem "database_cleaner"
  gem "factory_girl_rails", "~> 4.8.0"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "guard-rspec", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
