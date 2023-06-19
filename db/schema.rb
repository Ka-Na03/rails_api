ActiveRecord::Schema[7.0].define(version: 2023_06_18_105229) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

end
