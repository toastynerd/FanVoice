class SourceMaterial < ActiveRecord::Base
  attr_accessible :description, :genre, :title
  has_many :characters, :dependent => :delete_all

  validates :title, :presence => true
  validates :genre, :presence => true
  validates :description, :presence => true
end
