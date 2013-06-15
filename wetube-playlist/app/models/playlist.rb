class Playlist < ActiveRecord::Base
  has_many :playlist_videos
  has_many :videos, through: :playlist_videos

  def as_json(options={})
    {
      id: id,
      created_at: created_at,
      videos: videos
    }
  end

  
end
