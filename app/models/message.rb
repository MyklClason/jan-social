class Message < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'

  validates :creator, presence: true
  validates :content, presence: true, length: {minimum: 3, maximum: 150}
end
