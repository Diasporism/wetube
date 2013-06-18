class ChangeColumnUrlToVideoId < ActiveRecord::Migration
  def change
    rename_column :videos, :url, :video_id
  end
end
