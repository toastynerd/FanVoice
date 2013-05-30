require 'twitter'

class SendToTwitter
  @queue = :tweet_queue
  def self.perform(tweet_id, character_id)
    puts "sending tweet"
    @tweet = Tweet.find(tweet_id)
    puts "found tweet"
    @character = Character.find(character_id)
    puts "found character"
    @twitter_character = TwitterCharacter.find(@character.twitter_character_id)
    puts "found twitter character"
    @twitter_character.twitter.update(@tweet.body)
    puts "Sent tweet for #{@tweet.post_at} at #{Time.now} with #{@twitter_character.name}"
  end
end
