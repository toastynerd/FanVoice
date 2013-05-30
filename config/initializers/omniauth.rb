OmniAuth.config.logger = Rails.logger

Rails.application.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
end
