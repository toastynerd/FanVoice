class SourceMaterial < ActiveRecord::Base
  attr_accessible :description, :genre, :title

  validates :title, :presence => true
  validates :genre, :presence => true
  validates :description, :presence => true
end
