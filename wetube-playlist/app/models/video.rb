class Video < ActiveRecord::Base
  has_many :playlist_videos
  has_many :playlists, through: :playlist_videos

  attr_accessible :url,
                  :title

  validates :url,   presence: true
  validates :title, presence: true

  def add_to_playlist(playlist_id)
    playlist = Playlist.find(playlist_id)
    playlist.videos << self
  end

  def as_json(options={})
    super(except: [:created_at, :updated_at])
  end
end
