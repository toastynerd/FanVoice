class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle, :asset

  belongs_to :source_material
  belongs_to :user
  has_one :twitter_character
  has_many :tweets
  has_attached_file :asset

  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true
end
