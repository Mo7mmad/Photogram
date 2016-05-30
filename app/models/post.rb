class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :user_id, presence: true

end
