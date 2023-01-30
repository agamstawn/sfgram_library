class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :countries, array: true, default: []
      t.string :gender
      t.json :wikipedia
      t.integer :n_books
      t.string :summary
      t.datetime :born
      t.integer :books, array: true, default: []
      t.datetime :died
      t.timestamps
    end
  end
end
