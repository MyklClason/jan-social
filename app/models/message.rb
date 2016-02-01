class Message < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => "user_id"

  validates :creator, presence: true
  validates :content, presence: true, length: {minimum: 3, maximum: 150}

  acts_as_votable

end
