source "https://rubygems.org"

gem 'berkshelf', '~> 2.0'

group :test do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop'
end

group :development do
  gem 'guard', '~> 1.8'
  gem 'guard-foodcritic'
  gem 'guard-rubocop'
end

group :integration do
  gem 'kitchen-vagrant'
  gem 'test-kitchen'
end
