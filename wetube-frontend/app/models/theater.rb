class Theater < ActiveRecord::Base
  attr_accessible :name, :genre

  before_create :initialize_theater
    

  def initialize_theater
    conversation_id, playlist_id = Wetube::Theater.create
    self.conversation_id = conversation_id
    self.playlist_id = playlist_id
  end

end
