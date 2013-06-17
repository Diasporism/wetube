  class Theater < ActiveRecord::Base
  attr_accessible :name, :genre
  validates_uniqueness_of [:conversation_id, :playlist_id, :name, :slug]
  validates_presence_of [:name, :genre]
  validate :playlist_id, presence: {on: :create}
  validate :conversation_id, presence: {on: :create}

  before_create :initialize_theater_from_gem
  before_create :register_slug

  def to_param
    slug
  end
    
  def initialize_theater_from_gem
    components = Wetube::Theater.create
    self.conversation_id = components.conversation_id
    self.playlist_id = components.playlist_id
  end

  def register_slug
    self.slug = name.downcase.gsub(/[^0-9a-z]/, " ").split(" ").join("-")
  end
end
