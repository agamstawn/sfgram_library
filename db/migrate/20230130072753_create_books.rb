class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :content_name
      t.string :author_name
      t.text :images_urls, array: true, default: []
      t.integer :year
      t.text :images, array: true, default: []
      t.string :category
      t.text :genres, array: true, default: []
      t.string :copyright
      t.string :title
      t.json :wikipedia
      t.float :average_rating
      t.json :goodreads
      t.text :similar_books, array: true, default: []
      t.string :description
      t.string :loc_class
      t.json :gutenberg
      t.text :authors, array: true, default: []
      t.string :language
      t.integer :countries, array: true, default: []
      t.datetime :release_date
      t.integer :author
      t.string :cover
      t.boolean :content_cleaned
      t.text :classes, array: true, default: []
      t.boolean :content_available
      t.integer :n_authors
      t.timestamps
    end
  end
end
