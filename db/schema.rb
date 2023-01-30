# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_30_084007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.integer "countries", default: [], array: true
    t.string "gender"
    t.json "wikipedia"
    t.integer "n_books"
    t.string "summary"
    t.datetime "born"
    t.integer "books", default: [], array: true
    t.datetime "died"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "content_name"
    t.string "author_name"
    t.text "images_urls", default: [], array: true
    t.integer "year"
    t.text "images", default: [], array: true
    t.string "category"
    t.text "genres", default: [], array: true
    t.string "copyright"
    t.string "title"
    t.json "wikipedia"
    t.float "average_rating"
    t.json "goodreads"
    t.text "similar_books", default: [], array: true
    t.string "description"
    t.string "loc_class"
    t.json "gutenberg"
    t.text "authors", default: [], array: true
    t.string "language"
    t.integer "countries", default: [], array: true
    t.datetime "release_date"
    t.integer "author"
    t.string "cover"
    t.boolean "content_cleaned"
    t.text "classes", default: [], array: true
    t.boolean "content_available"
    t.integer "n_authors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "isbn"
    t.string "original_title"
    t.string "language_code"
    t.text "plot"
    t.integer "rating_count"
    t.integer "pages"
    t.string "isbn13"
    t.text "summary"
    t.string "cover_art_url"
    t.string "format"
    t.string "cover_art"
    t.json "contents", default: []
  end

end
