class Message < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_one :preference, :class_name => 'like_dislike'

  validates :creator, presence: true
  validates :content, presence: true, length: {minimum: 3, maximum: 150}

  # For likes/dislikes
  acts_as_votable
end
