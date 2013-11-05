source 'https://rubygems.org'

gem 'rails', '3.2.13'

#get form error messages
gem 'simple_form'
gem 'dynamic_form'

#authentication / authorization
gem 'devise', '2.1.0'
gem 'cancan', '1.6.7'
gem 'pg', group: :production
gem 'therubyracer', group: :production
gem 'unicorn'

#combining all rake tasks into one file
gem 'foreman'

#Scheduling for sending future tweets
gem 'resque', :require => "resque/server"
gem 'resque-scheduler'

#stuff for sending tweets
gem 'omniauth-twitter'
gem 'twitter'

#gem for facebook authentication
gem 'omniauth-facebook'

#environment variables
gem 'figaro'

#file uploading
gem "rmagick"
gem "carrierwave"
gem "fog", "~> 1.3.1"
gem "carrierwave_direct"
gem "sidekiq"

# New relic for applicaiton monitoring and pinging
gem 'newrelic_rpm'


# pry debugging for test and dev
group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'launchy'
  gem 'sqlite3'

end

# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes

  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0'
  # For asset upload


  #for datepicker
  gem 'jquery-ui-rails'
  gem 'jquery-timepicker-addon-rails'
end

group :development do
  gem 'rspec-rails', '~> 2.11'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl', '2.6.4'
  gem 'simplecov', :require => false
  gem 'email_spec', '1.2.1'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
