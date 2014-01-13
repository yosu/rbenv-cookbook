source "https://rubygems.org"

gem 'berkshelf', '~> 2.0'

group :test do
  gem 'chefspec', '~> 3.1'
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop'
end

group :development do
  gem 'guard', '~> 1.8'
  gem 'guard-foodcritic'
  gem 'guard-rubocop'
  gem 'guard-rspec'
end

group :integration do
  gem 'kitchen-vagrant'
  gem 'test-kitchen'
end
