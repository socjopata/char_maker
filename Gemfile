source 'http://rubygems.org'
ruby "2.2.1"

gem "rails", github: "rails/rails", branch: "3-2-stable" #3.2.21 has an issue with .size (when used with ruby 2.2)

gem 'pg', '~> 0.18.1'
gem 'devise'
gem 'carrierwave', '~> 0.10.0'
gem 'rmagick', '~> 2.13.4'
gem 'jquery-rails', '~> 3.1.2'
gem 'jquery-ui-rails', '~> 5.0.3'
gem 'jquery-colorbox-rails', '~> 0.2.3'
gem 'exception_logger', require: 'exception_logger', git: 'git://github.com/ryancheung/exception_logger.git' #updating requires rails 4
gem 'galetahub-simple_captcha', '~>0.1.5', require: 'simple_captcha'
gem 'pdfkit', '~> 0.6.2'
gem 'thin', '~> 1.6.3'
gem 'simple_form', '~> 2.1.2'
gem 'will_paginate', '~> 3.0.7'
gem "haml-rails", '~> 0.4.0' #bump to a newer version and use converters

group :development, :test do
  gem 'test-unit'  #Handling error, https://github.com/rspec/rspec-rails/issues/1273
  gem 'magic_encoding' ## coding: utf-8  type magic_encoding in the console
  gem 'pry', '~> 0.10.1'
  gem 'better_errors' #requires newer ruby
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'rspec-rails', "~> 2.14.2"
  gem 'capybara', git: 'git://github.com/jnicklas/capybara.git'
  gem 'launchy', '~> 2.4.3'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'ffaker', '~> 2.0.0'
end

gem 'sass-rails', '~> 3.2.6'
gem 'bootstrap-sass', '~> 2.3.0.0' #max bump 3.1.1.0, but breaks styling. bumping it higher requires rails 4
gem 'coffee-rails', '~> 3.2.2'
gem 'uglifier', '~> 2.7.1'
gem 'turbo-sprockets-rails3', '~> 0.3.14'
gem 'therubyracer', '~> 0.12.1', platform: :ruby
gem 'libv8', '~> 3.16.14.7'