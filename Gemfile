source 'https://rubygems.org'

gem 'rails', '4.0.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'foundation-rails'

gem "font-awesome-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#Mongoid
gem 'mongoid'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
end

group :development, :test do
  gem 'rspec-rails'
  gem "factory_girl_rails"
  # for coverage report
  gem 'simplecov', '0.6.1'
  gem 'simplecov-rcov', '0.2.3'
end

group :test do
  gem "database_cleaner"
  gem "email_spec"
  gem 'mocha'
end

gem 'rvm1-capistrano3', require: false

# Use debugger
gem 'debugger', group: [:development, :test]

gem 'rails_admin'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem "mini_magick"
gem "fog", "~> 1.3.1"

# for cms
gem "ya2yaml"

#for caching
gem 'dalli'