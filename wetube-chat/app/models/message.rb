class Message < ActiveRecord::Base
  attr_accessible :content,
                  :user_id

  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :conversation
end
