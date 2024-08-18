source "https://rubygems.org"

ruby "3.3.4"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

gem "devise"
gem "devise_token_auth"
gem "pundit"                   # For authorization
gem "light-service"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :test do
  gem "shoulda-matchers", "~> 6.0"
  gem 'pundit-matchers', '~> 3.1'
end

group :development do
end
