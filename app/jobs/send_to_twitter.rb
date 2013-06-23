require 'twitter'

class SendToTwitter
  @queue = :tweet_queue
  def self.perform(tweet_id, character_id)
    if @tweet = Tweet.find(tweet_id)
      if @character = Character.find(character_id)
        if @twitter_character = TwitterCharacter.find(@character.twitter_character_id)
          if @twitter_character.twitter.update(@tweet.body)
            Rails.logger.info "Sent tweet for #{@tweet.post_at} at #{Time.now} with #{@twitter_character.name}"
          end
        else
          Rails.logger.error "Could not find twitter character for #{@character.name}"  
        end
      else
        Rails.logger.error "Could not find character for id# #{character_id}"
      end
    else
      Rails.logger.error "Could not find tweet # #{tweet_id}"
    end
  end
end
