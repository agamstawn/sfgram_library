class AddCoverArtUrlToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :cover_art_url, :string
  end
end
