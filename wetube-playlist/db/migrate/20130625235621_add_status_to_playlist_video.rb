class AddStatusToPlaylistVideo < ActiveRecord::Migration
  def change
    add_column :playlist_videos, :status, :string, default: 'queued'
  end
end
