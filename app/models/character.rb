class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle, :image, :remote_image_url

  mount_uploader :image, ImageUploader
  belongs_to :source_material
  belongs_to :user
  has_one :twitter_character
  has_many :tweets


  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true
end
