CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AMAZON_ID"],                        # required
    :aws_secret_access_key  => ENV["AMAZON_SECRET_KEY"],                        # required
    # :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                     # required
  #  config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  if Rails.env.test? or Rails.env.cucumber?
    CarrierWave.configure do |config|
      config.storage = :fog
      config.enable_processing = false
    end
  end
  if Rails.env.development?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end
end
