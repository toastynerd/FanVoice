require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup => :environment do

    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    Resque.redis = ENV["REDISTOGO_URL"]

    Resque::Scheduler.dynamic = true

    require 'send_to_twitter'
  end
end
