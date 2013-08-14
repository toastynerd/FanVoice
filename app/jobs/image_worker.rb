class ImageWorker
  @queue = :image_queue
  def self.perform(id, key)
    sleep 5
    character = Character.find(id)
    character.key = key
    character.remote_image_url = character.image.direct_fog_url(with_path: true)
    character.save!
  end
end
