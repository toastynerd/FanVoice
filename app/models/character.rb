class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle, :image, :remote_image_url, :crop_x, :crop_y, :crop_w, :crop_h
  #image uploading features
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  def crop_image
    image.recreate_versions! if crop_x.present?
  end


  belongs_to :source_material
  belongs_to :user
  has_one :twitter_character
  has_many :tweets


  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true
end
