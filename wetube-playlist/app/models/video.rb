class Video < ActiveRecord::Base
  has_many :playlist_videos
  has_many :playlists, through: :playlist_videos

  attr_accessible :video_id,
                  :title,
                  :thumbnail

  validates :video_id,  presence: true
  validates :title,     presence: true
  validates :thumbnail, presence: true

  def add_to_playlist(playlist_id)
    playlist = Playlist.find(playlist_id)
    playlist.videos << self
  end

  def as_json(options={})
    super(except: [:created_at, :updated_at])
  end
end
