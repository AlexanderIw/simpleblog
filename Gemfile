source 'https://rubygems.org'

gem 'rails', '4.2.7'
gem 'mysql2', '>= 0.3.13', '< 0.5' # Use mysql as the database for Active Record

gem 'bcrypt', '~> 3.1.7'   # Use ActiveModel has_secure_password
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'# Use CoffeeScript for .coffee assets and views
gem 'turbolinks'   # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

#slugs for the blog
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+


# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'byebug'  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :doc do# bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', require: false
end

group :development do
  gem 'web-console', '~> 2.0'  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring' #Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  
  gem 'rspec-rails','~> 3.5'
  gem 'guard-rspec', '~> 4.7'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'capybara', '~> 2.4.4'
end

