class AddIndexToBooks < ActiveRecord::Migration[7.0]
  def change
    add_index :books, :id, unique: true
  end
end