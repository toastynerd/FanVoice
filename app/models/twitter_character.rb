class TwitterCharacter < ActiveRecord::Base

  belongs_to :character
  def self.from_omniauth(auth)
    twitter_character = where(auth.slice("provider","uid")).first || create_from_omniauth(auth)
    twitter_character.oauth_token = auth["credentials"]["token"]
    twitter_character.oauth_secret = auth["credentials"]["secret"]
    twitter_character.save
    twitter_character
  end

  def self.create_from_omniauth(auth)
    create! do |twitter_character|
      twitter_character.provider = auth["provider"]
      twitter_character.uid = auth["uid"]
      twitter_character.name = auth["info"]["nickname"]
    end
  end

  def twitter
    if provider == "twitter"
      @twitter = Twitter::Client.new(oauth_token: oauth_token, 
                                     oauth_token_secret: oauth_secret)
    end
  end

end
