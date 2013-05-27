class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle
  belongs_to :source_material
  belongs_to :user
  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true


end
