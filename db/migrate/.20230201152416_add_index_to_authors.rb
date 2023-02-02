class AddIndexToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_index :authors, :id, unique: true
  end
end

