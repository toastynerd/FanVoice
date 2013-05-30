require 'twitter'

class SendToTwitter
  @queue = :tweet_queue
  def self.perform
    puts "sending tweet"
  end
end
