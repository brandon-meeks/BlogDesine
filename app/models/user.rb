class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, exclusion: { in: %w(admin webmaster),
    message: "%{value} is reserved" }
         
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  def editor?
    self.role == 'editor'
  end
  
end
