class PlaylistVideo < ActiveRecord::Base
  attr_accessible :status

  belongs_to :video
  belongs_to :playlist
end
