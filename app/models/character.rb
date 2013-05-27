class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle
  validates :bio, presence: :true
  validates :name, presence: :true
  validates :handle, presence: :true


end
