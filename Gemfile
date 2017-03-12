source 'https://rubygems.org'

gem 'rails', '4.2.7'
gem 'mysql2', '>= 0.3.13', '< 0.5' # Use mysql as the database for Active Record

gem 'bcrypt', '~> 3.1.7'      # Use ActiveModel has_secure_password
gem 'sass-rails', '~> 5.0'    # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'    # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'# Use CoffeeScript for .coffee assets and views
gem 'turbolinks'   # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'friendly_id',    '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'bootstrap-sass', '~> 3.3.7'

group :development do
  gem 'web-console', '~> 2.0'         #Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring','~>2.0.1'              #Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  
  gem 'rspec-rails','~> 3.5'          #for testing the rails app
  gem 'guard-rspec', '~> 4.7'         #automate of test
  gem 'selenium-webdriver', '~>3.3.0' #more automations testing
  gem 'rb-fsevent', '~> 0.9.8' if `uname` =~ /Darwin/ #monitor the file system on mac
  gem 'capybara', '~> 2.4.4'           #enable test web app as a user ;-)
  gem 'factory_girl_rails', '~> 4.0'   #factories are a more convenient way to define user objects and insert them in the database
  
  gem 'rails-footnotes', '~> 4.0'     #it is cool for debugging and learning
end

group :development, :test do
  gem 'byebug', '~> 9.0.6'  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end