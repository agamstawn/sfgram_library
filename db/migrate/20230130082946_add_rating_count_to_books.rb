class AddRatingCountToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :rating_count, :integer
  end
end
