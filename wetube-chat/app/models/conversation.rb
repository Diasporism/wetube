class Conversation < ActiveRecord::Base
  has_many :messages

  def as_json(options={})
    {
      id: id,
      created_at: created_at,
      messages: messages
    }
  end
end
