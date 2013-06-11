class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :admin, :as => :admin
  has_many :permissions
  def to_s
  "#{email} (#{admin? ? "Admin" : "User"})"
  end
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|

  # attr_accessible :title, :body
end
