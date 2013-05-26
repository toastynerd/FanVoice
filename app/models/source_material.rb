class SourceMaterial < ActiveRecord::Base
  attr_accessible :description, :genre, :title
  has_many :characters

  validates :title, :presence => true
  validates :genre, :presence => true
  validates :description, :presence => true
end
