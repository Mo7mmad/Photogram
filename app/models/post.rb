class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_attached_file :image
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :user_id, presence: true
  scope :of_followed_users, -> (following_users) { where user_id: following_users }  
end
