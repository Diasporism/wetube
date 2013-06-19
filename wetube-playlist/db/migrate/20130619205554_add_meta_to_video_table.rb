class AddMetaToVideoTable < ActiveRecord::Migration
  def change
    add_column :videos, :thumbnail, :string
  end
end
