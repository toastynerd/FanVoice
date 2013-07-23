scheduler: bundle exec rake resque:scheduler
worker: bundle exec rake resque:work QUEUE='*'
worker: bundle exec sidekiq
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
