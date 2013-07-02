class AddNameToMessagesTable < ActiveRecord::Migration
  def change
    add_column :messages, :name, :string
  end
end
