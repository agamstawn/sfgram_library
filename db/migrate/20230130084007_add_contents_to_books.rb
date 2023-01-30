class AddContentsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :contents, :json, default: []
  end
end
