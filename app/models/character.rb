class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle, :image, :remote_image_url, :crop_x, :crop_y, :crop_w, :crop_h, :source_material_id

  #image uploading features

  mount_uploader :image, ImageUploader
  after_save :enqueue_image
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  # after_update :crop_image

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  def image_name
    File.basename(image.path || image.filename) if image
  end

  class ImageWorker
    include Sidekiq::Worker
      def peform(id, key)
        character = character.find(id)
        character.key = key
        character.remote_image_url = character.image.direct_fog_url(with_path: true)
        character.save!
    end
  end



  # def crop_image
  #   image.recreate_versions! if crop_x.present?
  # end

  belongs_to :source_material
  belongs_to :user
  has_one :twitter_character
  has_many :tweets


  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true
  validates :source_material_id, presence: :true
end
