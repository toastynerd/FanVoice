class Tweet < ActiveRecord::Base
  belongs_to :character
  belongs_to :user
  attr_accessible :body, :post_at

  validates :body, :presence => true
  validates :post_at, :uniqueness => true
end
