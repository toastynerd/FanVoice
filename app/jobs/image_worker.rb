class ImageWorker
  include Sidekiq::Worker
  def peform(id, key)
    character = character.find(id)
    character.key = key
    character.remote_image_url = character.image.direct_fog_url(with_path: true)
    character.save!
  end
end
