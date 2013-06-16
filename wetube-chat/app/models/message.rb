class Message < ActiveRecord::Base
  attr_accessible :content,
                  :user_id

  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :conversation

  def as_json(options={})
    super(only: [:id, :content, :user_id, :created_at])
  end
end
