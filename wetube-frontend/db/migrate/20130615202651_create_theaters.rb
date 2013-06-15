class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.integer :conversation_id
      t.integer :playlist_id
      t.string :name
      t.string :genre
      t.boolean :private, :default => false

      t.timestamps
    end
  end
end
