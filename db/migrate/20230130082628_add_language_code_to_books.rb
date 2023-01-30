class AddLanguageCodeToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :language_code, :string
  end
end
