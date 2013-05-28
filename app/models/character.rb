class Character < ActiveRecord::Base
  attr_accessible :bio, :name, :handle

  validates :name, :presence => true
  validates :bio, :presence => true
  validates :handle, :presence => true
end
