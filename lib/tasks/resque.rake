require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup => :environment do

    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/" )
    REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    Resque.redis = REDIS

    Resque::Scheduler.dynamic = true

    require 'send_to_twitter'
  end
end
