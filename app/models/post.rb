class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
    belongs_to :topic
    mount_uploader :image, ImageUploader

  #default_scope { order('created_at DESC') }

  scope :ordered_by_title, -> { order(title: :asc) } # Post.ordered_by_title

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
