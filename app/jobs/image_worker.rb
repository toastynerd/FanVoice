class ImageWorker
  @queue = :image_queue
  def self.perform(id, key)
    # begin
    character = Character.find(id)
    #   raise 'An error has occurred'
    # rescue
    #   sleep 20
    #   character = Character.find(id)
    # end
    character.key = key
    character.remote_image_url = character.image.direct_fog_url(with_path: true)
    character.save!
  end
end
