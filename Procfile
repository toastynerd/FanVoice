server: bundle exec rails server
scheduler: bundle exec rake resque:scheduler
worker: bundle exec rake resque:work QUEUE='*'
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: env TERM_CHILD=1 bundle exec rake jobs:work
