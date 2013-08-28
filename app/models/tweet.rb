
class Tweet < ActiveRecord::Base
  belongs_to :character
  belongs_to :user
  attr_accessible :body, :post_at
  before_validation :set_default_time
  validates :body, :presence => true
  validates :post_at, :uniqueness => true

  def set_default_time
    if post_at.nil?
      post_at = Time.now
    end
  end
end
