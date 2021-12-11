# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'
gem 'rails', '~> 6.1.3'
gem 'pg'
gem 'puma', '~> 5.0'

gem 'active_model_serializers'
gem 'figaro'
gem 'icalendar'
gem 'rubocop', require: false
gem 'faker'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'bullet'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem "jwt", "~> 2.3"
gem "bcrypt", "~> 3.1"
