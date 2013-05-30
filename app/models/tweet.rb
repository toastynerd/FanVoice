class Tweet < ActiveRecord::Base
  belongs_to :character
  attr_accessible :body, :post_at
end
