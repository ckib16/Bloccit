class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
    belongs_to :topic

  #default_scope { order('created_at DESC') }

  scope :ordered_by_title, -> { order(title: :asc) } # Post.ordered_by_title
end
