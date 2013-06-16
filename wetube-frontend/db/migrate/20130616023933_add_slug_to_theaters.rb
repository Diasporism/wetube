class AddSlugToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :slug, :string
    add_index :theaters, :slug
  end
end
