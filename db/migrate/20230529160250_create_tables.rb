class CreateTables < ActiveRecord::Migration[7.0]
  def change
    enable_extension "plpgsql"

    create_table "articles", force: :cascade do |t|
      t.string "title"
      t.text "content"
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_articles_on_user_id"
    end

    create_table "comments", force: :cascade do |t|
      t.text "content"
      t.bigint "user_id", null: false
      t.bigint "article_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["article_id"], name: "index_comments_on_article_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "role"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "password_digest"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "articles", "users"
    add_foreign_key "comments", "articles"
    add_foreign_key "comments", "users"
  end
end
