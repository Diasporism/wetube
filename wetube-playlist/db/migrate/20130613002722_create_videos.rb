class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :uploader
      t.string :title
      t.string :uploaded_at
      t.integer :duration

      t.timestamps
    end
  end
end
