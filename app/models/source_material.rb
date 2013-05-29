class SourceMaterial < ActiveRecord::Base
  attr_accessible :description, :genre, :title
  has_many :characters, :dependent => :delete_all

  validates :title, :presence => true
  validates :genre, :presence => true
  validates :description, :presence => true

  validates :title, :presence => true, :uniqueness => true
  has_many :permissions, :as => :thing
  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  end
  def self.for(user)
    user.admin? ? SourceMaterial : SourceMaterial.viewable_by(user)
  end
end
