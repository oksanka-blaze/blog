source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use slim instead of erb
gem 'slim-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Authentication for Rails
gem 'sorcery'
group :development, :test do
  # Use pry for debug.
  gem 'pry-rails'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-remote'

  gem 'factory_girl_rails'
  gem 'ffaker'

  # Rails-tasks like migrations and compile assets
  gem 'capistrano-rails'
  # To work with bundler
  gem 'capistrano-bundler'
  # To work with Rbenv
  gem 'capistrano-rbenv'
  # To work with Puma
  gem 'capistrano3-puma'
end

group :development do
  gem 'listen'
end
group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
