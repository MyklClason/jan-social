class LikeDislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates :user, presence: true
  validates :message, presence: true
  # Allow only one instance of a given user/message combination
  validates_uniqueness_of :user, :scope => :message
end
